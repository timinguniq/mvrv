import 'package:dio/dio.dart';

/// BGeometrics(bitcoin-data.com) MVRV Z-Score API 클라이언트
class MvrvApi {
  MvrvApi(this._dio);

  final Dio _dio;

  /// 가장 최근 MVRV Z-Score 조회
  Future<Response> getLatestMvrvZscore() async {
    return _dio.get('/mvrv-zscore/last');
  }
}
