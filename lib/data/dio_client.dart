import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';
import 'package:stories_data/core/utils/logger.dart';

final _env = DotEnv(includePlatformEnvironment: true)..load();

class DioClient {
  final Dio _dio;

  DioClient({required Dio dio}) : _dio = dio;

  Dio get dio => _dio;

  void init() {
    _dio.interceptors.addAll([
      LogInterceptor(
        requestBody: false,
        responseBody: true,
        responseHeader: false,
        requestHeader: false,
        request: false,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['x-api-key'] = _env['API_KEY'];
          return handler.next(options);
        },
        onError: (error, handler) {
          final errorMsg = error.response?.data['error'] as String;
          logger.e(errorMsg);
          return handler.next(error);
        },
      ),
    ]);
  }
}
