import 'package:dio/dio.dart';
import 'package:base_flutter_app/entity/entity.dart';

/// MVRV 온체인 데이터 API 클라이언트
class MvrvApi {
  MvrvApi(this._dio);

  final Dio _dio;

  /// 기간별 MVRV 히스토리 조회
  Future<Response> getMvrvHistory({int? days}) async {
    return _dio.get(
      '/v1/mvrv/history',
      queryParameters: {
        if (days != null) 'days': days,
      },
    );
  }

  /// 현재 MVRV 값 조회
  Future<Response> getCurrentMvrv() async {
    return _dio.get('/v1/mvrv/current');
  }
}
