import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mvrv/core/core.dart';

/// 대시보드 하단 적응형 배너 광고
///
/// 광고 단위 ID 는 릴리즈 모드 여부에 따라 `.env` 의 `*_PROD` / `*_DEV` 키에서 로드.
class DashboardBannerAd extends StatefulWidget {
  const DashboardBannerAd({super.key});

  @override
  State<DashboardBannerAd> createState() => _DashboardBannerAdState();

  static String get _androidAdUnitId => dotenv.env[kReleaseMode
          ? 'ADMOB_BANNER_AD_UNIT_ID_ANDROID_PROD'
          : 'ADMOB_BANNER_AD_UNIT_ID_ANDROID_DEV'] ??
      '';

  static String get _iosAdUnitId => dotenv.env[kReleaseMode
          ? 'ADMOB_BANNER_AD_UNIT_ID_IOS_PROD'
          : 'ADMOB_BANNER_AD_UNIT_ID_IOS_DEV'] ??
      '';
}

class _DashboardBannerAdState extends State<DashboardBannerAd> {
  static final _logger = CustomLogger.create(tag: 'DashboardBannerAd');

  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bannerAd == null) {
      _loadAd();
    }
  }

  Future<void> _loadAd() async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;

    final width = MediaQuery.of(context).size.width.truncate();
    final size =
        await AdSize.getLargeAnchoredAdaptiveBannerAdSizeWithOrientation(
          Orientation.portrait,
          width,
        );
    if (size == null) {
      _logger.w('Adaptive banner size를 가져오지 못함');
      return;
    }

    final ad = BannerAd(
      adUnitId: Platform.isAndroid
          ? DashboardBannerAd._androidAdUnitId
          : DashboardBannerAd._iosAdUnitId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (!mounted) return;
          setState(() => _isLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          _logger.w('Banner ad load 실패: $error');
        },
      ),
    );

    await ad.load();
    if (!mounted) {
      await ad.dispose();
      return;
    }
    _bannerAd = ad;
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ad = _bannerAd;
    if (ad == null || !_isLoaded) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: ad.size.width.toDouble(),
      height: ad.size.height.toDouble(),
      child: AdWidget(ad: ad),
    );
  }
}
