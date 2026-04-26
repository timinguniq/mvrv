import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'btc_price.api.g.dart';

/// CoinGecko 시세 API 클라이언트
@RestApi()
abstract class BtcPriceApi {
  factory BtcPriceApi(Dio dio, {String baseUrl}) = _BtcPriceApi;

  /// BTC 현재가 + 24h 변동률 조회 (USD)
  @GET('/simple/price')
  Future<HttpResponse<dynamic>> getBtcPrice({
    @Query('ids') required String ids,
    @Query('vs_currencies') required String vsCurrencies,
    @Query('include_24hr_change') required bool include24hrChange,
  });
}
