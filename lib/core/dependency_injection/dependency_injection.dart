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
    ..registerSingleton<MvrvApi>(MvrvApi(CHttpClient.bgeometricsDio));
}

void _repository() {
  locator
    ..registerSingleton<BtcPriceRepository>(
      BtcPriceRepositoryImpl(locator<BtcPriceApi>()),
    )
    ..registerSingleton<MvrvRepository>(MvrvRepositoryImpl(locator<MvrvApi>()));
}

void _usecase() {
  locator
    ..registerSingleton<BtcPriceUsecase>(
      BtcPriceUsecase(locator<BtcPriceRepository>()),
    )
    ..registerSingleton<MvrvUsecase>(MvrvUsecase(locator<MvrvRepository>()));
}

void _manager() {
  // 현재 매니저 없음
}
