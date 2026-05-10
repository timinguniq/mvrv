import 'package:mvrv/core/core.dart';
import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';

final _logger = CustomLogger.create(tag: (GetNuplHistoryUsecase).toString());

/// NUPL 히스토리 조회 UseCase
class GetNuplHistoryUsecase extends RemoteUsecase<NuplRepository> {
  GetNuplHistoryUsecase({this.from, this.to});

  final DateTime? from;
  final DateTime? to;

  @override
  Future<Result<List<NuplData>>> call(NuplRepository repository) async {
    final response = await repository.getNuplHistory(from: from, to: to);

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
