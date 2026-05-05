import 'package:mvrv/core/core.dart';
import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

final _logger = CustomLogger.create(tag: (GetBtcPriceUsecase).toString());

/// 비트코인 현재가 조회 UseCase
class GetBtcPriceUsecase extends RemoteUsecase<MvrvRepository> {
  GetBtcPriceUsecase();

  @override
  Future<Result<BtcPrice>> call(MvrvRepository repository) async {
    final response = await repository.getBtcPrice();

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
