import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

/// MVRV 데이터 Repository 인터페이스
abstract interface class MvrvRepository extends Repository {
  /// 현재 MVRV Z-Score 조회
  Future<Result<MvrvData>> getCurrentMvrv();
}
