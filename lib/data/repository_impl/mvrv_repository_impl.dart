import 'package:mvrv/core/core.dart';
import 'package:mvrv/data/data.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/domain/domain.dart';

final _logger = CustomLogger.create(tag: (MvrvRepositoryImpl).toString());

/// MVRV Z-Score / BTC 시세 Repository 구현체
///
/// MVRV Z-Score 는 Firestore 캐시(`mvrv_z_history`) 에서 읽고,
/// BTC 시세는 CoinGecko API 를 직접 호출
class MvrvRepositoryImpl implements MvrvRepository {
  MvrvRepositoryImpl(this._api, this._firestoreDatasource);

  final MvrvApi _api;
  final MvrvFirestoreDatasource _firestoreDatasource;

  @override
  Future<Result<MvrvData>> getCurrentMvrv() async {
    try {
      final data = await _firestoreDatasource.getLatest();
      if (data == null) {
        return Result.failure(
          ErrorResult(message: 'Firestore mvrv_z_history 컬렉션이 비어있습니다.'),
        );
      }
      return Result.success(data);
    } catch (e, st) {
      _logger.e('getCurrentMvrv 실패', error: e, stackTrace: st);
      return Result.failure(ErrorResult(message: e.toString()));
    }
  }

  @override
  Future<Result<List<MvrvData>>> getMvrvHistory({
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final list = await _firestoreDatasource.getHistory(from: from, to: to);
      return Result.success(list);
    } catch (e, st) {
      _logger.e('getMvrvHistory 실패', error: e, stackTrace: st);
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
