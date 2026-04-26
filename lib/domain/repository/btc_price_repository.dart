import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

/// BTC 시세 Repository 인터페이스
abstract interface class BtcPriceRepository extends Repository{
  /// 비트코인 현재가 조회 (USD)
  Future<Result<BtcPrice>> getBtcPrice();
}
