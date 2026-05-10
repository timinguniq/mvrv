import 'package:shared_preferences/shared_preferences.dart';

/// 앱 실행 횟수를 SharedPreferences 에 저장/로드하는 로컬 데이터소스
class LaunchCountLocalDatasource {
  static const _key = 'app_launch_count';

  /// 저장된 실행 횟수를 반환. 키가 없으면 0.
  Future<int> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }

  /// 실행 횟수를 저장.
  Future<void> save(int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, count);
  }

  /// 저장된 실행 횟수를 삭제.
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
