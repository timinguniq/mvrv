import 'package:mvrv/domain/domain.dart';

class BtcPriceUsecase {
  BtcPriceUsecase(this._btcPriceRepository);

  final BtcPriceRepository _btcPriceRepository;

  Future<T> execute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_btcPriceRepository);
  }
}
