import 'package:mvrv/core/core.dart';
import 'package:mvrv/data/data.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/domain/domain.dart';

final _logger = CustomLogger.create(tag: (MvrvRepositoryImpl).toString());

/// MVRV Z-Score / BTC 시세 Repository 구현체
class MvrvRepositoryImpl implements MvrvRepository {
  MvrvRepositoryImpl(this._api);

  final MvrvApi _api;

  @override
  Future<Result<MvrvData>> getCurrentMvrv() async {
    try {
      final response = await _api.getLatestMvrvZscore();
      final raw = response.data as Map<String, dynamic>;
      final data = MvrvData(
        date: DateTime.parse(raw['d'] as String),
        mvrvZscore: (raw['mvrvZscore'] as num).toDouble(),
      );
      return Result.success(data);
    } catch (e, st) {
      _logger.e('getCurrentMvrv 실패', error: e, stackTrace: st);
      return Result.failure(ErrorResult(message: e.toString()));
    }
  }

  @override
  Future<Result<BtcPrice>> getBtcPrice() async {
    try {
      final response = await _api.getBtcPrice();
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
