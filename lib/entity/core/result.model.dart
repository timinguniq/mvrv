import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvrv/entity/entity.dart';

part 'result.model.freezed.dart';

@freezed
class Result<T> with _$Result {
  const factory Result.success(T data) = Success;

  const factory Result.failure(ErrorResult error) = Error;

  const Result._();

  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorResult error) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Error<T>) {
      return failure((this as Error<T>).error);
    }
    throw Exception('Unknown Result type');
  }
}
