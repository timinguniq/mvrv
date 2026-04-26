import 'package:mvrv/domain/domain.dart';

abstract class RemoteUsecase<T extends Repository> extends Usecase<T> {}
