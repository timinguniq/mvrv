import 'package:get_it/get_it.dart';
import 'package:mvrv/core/core.dart';
import 'package:mvrv/data/data.dart';
import 'package:mvrv/domain/domain.dart';

final locator = GetIt.instance;

void configureDependencyInjection(LocalStorage storage) {
  _data(storage);
  _repository();
  _manager();
  _usecase();
}

void _data(LocalStorage storage) {
  locator
    ..registerSingleton<BtcPriceApi>(BtcPriceApi(CHttpClient.coinGeckoDio))
    ..registerSingleton<MvrvApi>(MvrvApi(CHttpClient.dio))
    ..registerSingleton<MvrvAlertStorage>(MvrvAlertStorage(storage));
}

void _repository() {
  locator
    ..registerSingleton<BtcPriceRepository>(
      BtcPriceRepositoryImpl(locator<BtcPriceApi>()),
    )
    ..registerSingleton<MvrvRepository>(
      MvrvRepositoryImpl(locator<MvrvApi>(), locator<MvrvAlertStorage>()),
    );
}

void _usecase() {
  // 현재 MVRV 서비스는 Repository 직접 사용
  locator
    ..registerSingleton<BtcPriceUsecase>(BtcPriceUsecase(locator<BtcPriceRepository>()));
}

void _manager() {
  // 현재 매니저 없음
}
