import 'package:mvrv/core/core.dart';
import 'package:mvrv/data/data.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/domain/domain.dart';

final _logger = CustomLogger.create(tag: (MvrvRepositoryImpl).toString());

/// MVRV Z-Score Repository 구현체 (BGeometrics)
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
}
