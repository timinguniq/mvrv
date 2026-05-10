import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mvrv/core/dependency_injection/dependency_injection.dart';
import 'package:mvrv/core/util/util.dart';
import 'package:mvrv/data/data_source/local_storage/launch_count_local.datasource.dart';

final _logger = CustomLogger.create(tag: 'LaunchInterstitialAd');

/// 앱 실행 횟수를 SharedPreferences 에 누적하다가 [_threshold] 회마다
/// 전면광고를 1회 노출하고 카운터를 초기화한다.
class LaunchInterstitialAd {
  LaunchInterstitialAd._();

  static const _threshold = 5;

  static String get _androidAdUnitId =>
      dotenv.env[kReleaseMode
          ? 'ADMOB_INTERSTITIAL_AD_UNIT_ID_ANDROID_PROD'
          : 'ADMOB_INTERSTITIAL_AD_UNIT_ID_ANDROID_DEV'] ??
      '';

  static String get _iosAdUnitId =>
      dotenv.env[kReleaseMode
          ? 'ADMOB_INTERSTITIAL_AD_UNIT_ID_IOS_PROD'
          : 'ADMOB_INTERSTITIAL_AD_UNIT_ID_IOS_DEV'] ??
      '';

  /// 앱 시작 시 호출. 카운터를 1 증가시키고, 임계치 도달 시 광고 노출 후 카운터 삭제.
  static Future<void> handleLaunch() async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;

    final datasource = locator<LaunchCountLocalDatasource>();
    final next = (await datasource.load()) + 1;

    if (next < _threshold) {
      await datasource.save(next);
      _logger.d('app_launch_count=$next (threshold=$_threshold)');
      return;
    }

    final shown = await _loadAndShow();
    if (shown) {
      await datasource.clear();
      _logger.d('Interstitial 노출 후 카운터 삭제');
    } else {
      await datasource.save(next);
    }
  }

  static Future<bool> _loadAndShow() async {
    final adUnitId = Platform.isAndroid ? _androidAdUnitId : _iosAdUnitId;
    if (adUnitId.isEmpty) {
      _logger.w('Interstitial adUnitId 가 비어있어 노출 생략');
      return false;
    }

    final loaded = Completer<InterstitialAd?>();
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: loaded.complete,
        onAdFailedToLoad: (error) {
          _logger.w('Interstitial load 실패: $error');
          loaded.complete(null);
        },
      ),
    );

    final ad = await loaded.future;
    if (ad == null) return false;

    final dismissed = Completer<void>();
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        if (!dismissed.isCompleted) dismissed.complete();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _logger.w('Interstitial show 실패: $error');
        ad.dispose();
        if (!dismissed.isCompleted) dismissed.complete();
      },
    );
    await ad.show();
    await dismissed.future;
    return true;
  }
}
