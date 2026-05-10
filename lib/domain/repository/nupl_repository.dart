import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

/// NUPL Repository 인터페이스
abstract interface class NuplRepository extends Repository {
  /// 현재 NUPL 조회 (Firestore 기반)
  Future<Result<NuplData>> getCurrentNupl();

  /// NUPL 히스토리 조회 (Firestore 기반)
  ///
  /// [from] / [to] 가 null 이면 전체 범위
  Future<Result<List<NuplData>>> getNuplHistory({DateTime? from, DateTime? to});
}
