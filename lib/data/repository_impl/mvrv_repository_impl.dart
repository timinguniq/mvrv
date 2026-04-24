import 'package:mvrv/core/core.dart';
import 'package:mvrv/data/data.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/domain/domain.dart';

final _logger = CustomLogger.create(tag: (MvrvRepositoryImpl).toString());

/// MVRV Repository 구현체
class MvrvRepositoryImpl implements MvrvRepository {
  MvrvRepositoryImpl(this._api, this._alertStorage);

  final MvrvApi _api;
  final MvrvAlertStorage _alertStorage;

  @override
  Future<Result<List<MvrvData>>> getMvrvHistory(MvrvTimeframe timeframe) async {
    try {
      final response = await _api.getMvrvHistory(days: timeframe.days);
      final dataList = (response.data as List)
          .map((e) => MvrvData.fromJson(e as Map<String, dynamic>))
          .toList();
      return Result.success(dataList);
    } catch (e, st) {
      _logger.e('getMvrvHistory 실패', error: e, stackTrace: st);
      return Result.failure(ErrorResult(message: e.toString()));
    }
  }

  @override
  Future<Result<MvrvData>> getCurrentMvrv() async {
    try {
      final response = await _api.getCurrentMvrv();
      final data = MvrvData.fromJson(response.data as Map<String, dynamic>);
      return Result.success(data);
    } catch (e, st) {
      _logger.e('getCurrentMvrv 실패', error: e, stackTrace: st);
      return Result.failure(ErrorResult(message: e.toString()));
    }
  }

  @override
  Future<List<MvrvAlert>> getAlerts() async {
    return _alertStorage.getAlerts();
  }

  @override
  Future<void> saveAlert(MvrvAlert alert) async {
    final alerts = await _alertStorage.getAlerts();
    alerts.add(alert);
    await _alertStorage.saveAlerts(alerts);
  }

  @override
  Future<void> deleteAlert(String id) async {
    await _alertStorage.deleteAlert(id);
  }

  @override
  Future<void> toggleAlert(String id) async {
    final alerts = await _alertStorage.getAlerts();
    final index = alerts.indexWhere((e) => e.id == id);
    if (index == -1) return;
    final alert = alerts[index];
    alerts[index] = alert.copyWith(enabled: !alert.enabled);
    await _alertStorage.saveAlerts(alerts);
  }
}
