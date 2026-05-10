import 'package:mvrv/core/core.dart';
import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

final _logger = CustomLogger.create(tag: (GetCurrentNuplUsecase).toString());

/// 현재 NUPL 조회 UseCase
class GetCurrentNuplUsecase extends RemoteUsecase<NuplRepository> {
  GetCurrentNuplUsecase();

  @override
  Future<Result<NuplData>> call(NuplRepository repository) async {
    final response = await repository.getCurrentNupl();

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
