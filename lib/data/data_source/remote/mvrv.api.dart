import 'package:dio/dio.dart';

/// BTC 시세(CoinGecko) API 클라이언트
///
/// MVRV Z-Score 는 Firestore 캐시에서 읽으므로 여기에 포함되지 않음
class MvrvApi {
  MvrvApi(this._coinGeckoDio);

  final Dio _coinGeckoDio;

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
