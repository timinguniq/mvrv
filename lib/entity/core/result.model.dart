import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_flutter_app/entity/entity.dart';

part 'result.model.freezed.dart';

@freezed
class Result<T> with _$Result {
  const factory Result.success(T data) = Success;

  const factory Result.failure(ErrorResult error) = Error;
}
