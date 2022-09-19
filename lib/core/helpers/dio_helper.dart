import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nyt_app/core/strings/constants.dart';
import 'package:nyt_app/core/utils/response_utils.dart';

class DioHelper {
  Dio get client {
    final Dio _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        contentType: 'application/json',
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers['Connection'] = 'keep-alive';
          options.queryParameters['api-key'] = API_KEY;
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> e, ResponseInterceptorHandler handler) async {
          try {
            final Response<dynamic> result = responseHandler(e);
            return handler.next(result);
          } catch (e) {
            debugPrint('Ex: $e');
            final DioError error =
                DioError(requestOptions: RequestOptions(path: ''), error: e);
            return handler.reject(error);
          }
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {},
      ),
    );

    return _dio;
  }
}
