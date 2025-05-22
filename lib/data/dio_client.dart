import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
  final String _apiKey;

  DioClient({required Dio dio, required String apiKey})
    : _dio = dio,
      _apiKey = apiKey;

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
          options.headers['x-api-key'] = _apiKey;
          return handler.next(options);
        },
        onError: (error, handler) {
          final message = error.response?.data['error'] as String;
          return handler.next(error.copyWith(message: message));
        },
      ),
    ]);
  }
}
