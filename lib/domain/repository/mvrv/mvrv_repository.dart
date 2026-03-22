import 'package:base_flutter_app/entity/entity.dart';

/// MVRV 데이터 Repository 인터페이스
abstract class MvrvRepository {
  /// 기간별 MVRV 히스토리 조회
  Future<Result<List<MvrvData>>> getMvrvHistory(MvrvTimeframe timeframe);

  /// 현재 MVRV 값 조회
  Future<Result<MvrvData>> getCurrentMvrv();

  /// 저장된 알림 목록 조회
  Future<List<MvrvAlert>> getAlerts();

  /// 알림 저장
  Future<void> saveAlert(MvrvAlert alert);

  /// 알림 삭제
  Future<void> deleteAlert(String id);

  /// 알림 토글 (활성/비활성)
  Future<void> toggleAlert(String id);
}
