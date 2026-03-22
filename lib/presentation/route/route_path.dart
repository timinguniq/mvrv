part of 'custom_route.dart';

enum RoutePath {
  /// splash
  splash('/splash'),

  /// MVRV 대시보드
  dashboard('/dashboard'),

  /// 알림 설정
  alertSetting('/alert-setting'),

  ;

  const RoutePath(this.path);

  final String path;
}
