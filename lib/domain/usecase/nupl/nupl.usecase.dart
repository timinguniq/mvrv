import 'package:mvrv/domain/domain.dart';

class NuplUsecase {
  NuplUsecase(this._nuplRepository);

  final NuplRepository _nuplRepository;

  Future<T> execute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_nuplRepository);
  }
}
