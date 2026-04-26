import 'package:mvrv/core/core.dart';
import 'package:mvrv/data/data.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/domain/domain.dart';

final _logger = CustomLogger.create(tag: (BtcPriceRepositoryImpl).toString());

/// BTC 시세 Repository 구현체 (CoinGecko)
class BtcPriceRepositoryImpl implements BtcPriceRepository {
  BtcPriceRepositoryImpl(this._api);

  final BtcPriceApi _api;

  @override
  Future<Result<BtcPrice>> getBtcPrice() async {
    try {
      final response = await _api.getBtcPrice(
        ids: 'bitcoin',
        vsCurrencies: 'usd',
        include24hrChange: true,
      );
      final raw = response.data as Map<String, dynamic>;
      final btc = raw['bitcoin'] as Map<String, dynamic>;
      final price = BtcPrice(
        price: (btc['usd'] as num).toDouble(),
        changePercent24h: (btc['usd_24h_change'] as num).toDouble(),
      );
      return Result.success(price);
    } catch (e, st) {
      _logger.e('getBtcPrice 실패', error: e, stackTrace: st);
      return Result.failure(ErrorResult(message: e.toString()));
    }
  }
}
