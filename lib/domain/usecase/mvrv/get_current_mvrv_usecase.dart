import 'package:mvrv/core/core.dart';
import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

final _logger = CustomLogger.create(tag: (GetCurrentMvrvUsecase).toString());

/// 현재 MVRV Z-Score 조회 UseCase
class GetCurrentMvrvUsecase extends RemoteUsecase<MvrvRepository> {
  GetCurrentMvrvUsecase();

  @override
  Future<Result<MvrvData>> call(MvrvRepository repository) async {
    final response = await repository.getCurrentMvrv();

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
