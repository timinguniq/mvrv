import 'package:mvrv/core/core.dart';
import 'package:mvrv/data/data.dart';
import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

final _logger = CustomLogger.create(tag: (NuplRepositoryImpl).toString());

/// NUPL Repository 구현체
///
/// NUPL 은 Firestore 캐시(`nupl_history`) 에서 읽는다.
class NuplRepositoryImpl implements NuplRepository {
  NuplRepositoryImpl(this._firestoreDatasource);

  final NuplFirestoreDatasource _firestoreDatasource;

  @override
  Future<Result<NuplData>> getCurrentNupl() async {
    try {
      final data = await _firestoreDatasource.getLatest();
      if (data == null) {
        return Result.failure(
          ErrorResult(message: 'Firestore nupl_history 컬렉션이 비어있습니다.'),
        );
      }
      return Result.success(data);
    } catch (e, st) {
      _logger.e('getCurrentNupl 실패', error: e, stackTrace: st);
      return Result.failure(ErrorResult(message: e.toString()));
    }
  }

  @override
  Future<Result<List<NuplData>>> getNuplHistory({
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final list = await _firestoreDatasource.getHistory(from: from, to: to);
      return Result.success(list);
    } catch (e, st) {
      _logger.e('getNuplHistory 실패', error: e, stackTrace: st);
      return Result.failure(ErrorResult(message: e.toString()));
    }
  }
}
