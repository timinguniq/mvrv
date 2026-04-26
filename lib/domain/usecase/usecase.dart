import 'package:mvrv/domain/domain.dart';

// ignore: one_member_abstracts
abstract class Usecase<T extends Repository> {
  Future call(T repository);
}
