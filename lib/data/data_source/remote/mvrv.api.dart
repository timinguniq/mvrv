import 'package:dio/dio.dart';

/// MVRV Z-Score(BGeometrics) 및 BTC 시세(CoinGecko) API 클라이언트
class MvrvApi {
  MvrvApi(this._bgeometricsDio, this._coinGeckoDio);

  final Dio _bgeometricsDio;
  final Dio _coinGeckoDio;

  /// 가장 최근 MVRV Z-Score 조회
  Future<Response> getLatestMvrvZscore() async {
    return _bgeometricsDio.get('/mvrv-zscore/last');
  }

  /// BTC 현재가 + 24h 변동률 조회 (USD)
  Future<Response> getBtcPrice() async {
    return _coinGeckoDio.get(
      '/simple/price',
      queryParameters: {
        'ids': 'bitcoin',
        'vs_currencies': 'usd',
        'include_24hr_change': true,
      },
    );
  }
}
