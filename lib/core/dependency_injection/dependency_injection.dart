import 'package:get_it/get_it.dart';
import 'package:base_flutter_app/core/core.dart';
import 'package:base_flutter_app/data/data.dart';
import 'package:base_flutter_app/domain/domain.dart';

final locator = GetIt.instance;

void configureDependencyInjection(LocalStorage storage) {
  _data(storage);
  _repository();
  _manager();
  _usecase();
}

void _data(LocalStorage storage) {
  locator
    ..registerSingleton<MvrvApi>(MvrvApi(CHttpClient.dio))
    ..registerSingleton<MvrvAlertStorage>(MvrvAlertStorage(storage));
}

void _repository() {
  locator.registerSingleton<MvrvRepository>(
    MvrvRepositoryImpl(locator<MvrvApi>(), locator<MvrvAlertStorage>()),
  );
}

void _usecase() {
  // 현재 MVRV 서비스는 Repository 직접 사용
}

void _manager() {
  // 현재 매니저 없음
}
