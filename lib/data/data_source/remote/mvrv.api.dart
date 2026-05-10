import 'package:dio/dio.dart';

/// BTC 시세(Binance) API 클라이언트
///
/// MVRV Z-Score 는 Firestore 캐시에서 읽으므로 여기에 포함되지 않음
class MvrvApi {
  MvrvApi(this._binanceDio);

  final Dio _binanceDio;

  /// BTC 현재가 + 24h 변동률 조회 (USDT 기준)
  Future<Response> getBtcPrice() async {
    return _binanceDio.get(
      '/ticker/24hr',
      queryParameters: {'symbol': 'BTCUSDT'},
    );
  }
}
