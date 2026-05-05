import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

/// MVRV / BTC 시세 Repository 인터페이스
abstract interface class MvrvRepository extends Repository {
  /// 현재 MVRV Z-Score 조회 (Firestore 기반)
  Future<Result<MvrvData>> getCurrentMvrv();

  /// MVRV Z-Score 히스토리 조회 (Firestore 기반)
  ///
  /// [from] / [to] 가 null 이면 전체 범위
  Future<Result<List<MvrvData>>> getMvrvHistory({DateTime? from, DateTime? to});

  /// 비트코인 현재가 조회 (USD)
  Future<Result<BtcPrice>> getBtcPrice();
}
