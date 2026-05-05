import 'package:mvrv/core/core.dart';
import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

final _logger = CustomLogger.create(tag: (GetMvrvHistoryUsecase).toString());

/// MVRV Z-Score 히스토리 조회 UseCase
class GetMvrvHistoryUsecase extends RemoteUsecase<MvrvRepository> {
  GetMvrvHistoryUsecase({this.from, this.to});

  final DateTime? from;
  final DateTime? to;

  @override
  Future<Result<List<MvrvData>>> call(MvrvRepository repository) async {
    final response = await repository.getMvrvHistory(from: from, to: to);

    return response.map(
      success: (success) => Result.success(success.data),
      failure: (failure) {
        _logger.w(
          'invoke failure : resultCode=${failure.error.resultCode}, message=${failure.error.message}',
        );
        return Result.failure(failure.error);
      },
    );
  }
}
