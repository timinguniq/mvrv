import 'dart:convert';

import 'package:mvrv/core/core.dart';
import 'package:mvrv/entity/entity.dart';

/// MVRV 알림 설정 로컬 저장소
class MvrvAlertStorage {
  MvrvAlertStorage(this._storage);

  final LocalStorage _storage;

  static const _key = 'mvrv_alerts';

  /// 알림 목록 저장
  Future<void> saveAlerts(List<MvrvAlert> alerts) async {
    final jsonList = alerts.map((e) => e.toJson()).toList();
    await _storage.write(_key, jsonEncode(jsonList));
  }

  /// 저장된 알림 목록 조회
  Future<List<MvrvAlert>> getAlerts() async {
    final raw = await _storage.read(_key);
    if (raw == null) return [];
    final jsonList = jsonDecode(raw) as List;
    return jsonList
        .map((e) => MvrvAlert.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// 특정 알림 삭제
  Future<void> deleteAlert(String id) async {
    final alerts = await getAlerts();
    alerts.removeWhere((e) => e.id == id);
    await saveAlerts(alerts);
  }
}
