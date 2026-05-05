import 'package:mvrv/domain/domain.dart';

class MvrvUsecase {
  MvrvUsecase(this._mvrvRepository);

  final MvrvRepository _mvrvRepository;

  Future<T> execute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_mvrvRepository);
  }
}
