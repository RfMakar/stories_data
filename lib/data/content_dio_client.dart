import 'package:dio/dio.dart';

class ContentDioClient {
  final Dio _dio;
  final String _apiKey;

  ContentDioClient({
    required Dio dio,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey;

  Dio get dio => _dio;

  void init() {
    _dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        requestHeader: false,
        request: false,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['X-API-Key'] = _apiKey;
          return handler.next(options);
        },
        onError: (error, handler) {
          final data = error.response?.data;

          String message = error.message ?? 'Unknown error';

          if (data is Map<String, dynamic>) {
            message =
                data['detail']?.toString() ??
                data['error']?.toString() ??
                message;
          } else if (data is String) {
            message = data;
          }

          return handler.next(error.copyWith(message: message));
        },
      ),
    ]);
  }
}