import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

/// MVRV / BTC 시세 Repository 인터페이스
abstract interface class MvrvRepository extends Repository {
  /// 현재 MVRV Z-Score 조회
  Future<Result<MvrvData>> getCurrentMvrv();

  /// 비트코인 현재가 조회 (USD)
  Future<Result<BtcPrice>> getBtcPrice();
}
