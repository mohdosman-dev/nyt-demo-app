import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/core/strings/constants.dart';

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

Response responseHandler(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      return response;
    case 500:
      throw ServerFailure('Server Error please retry later');
    case 404:
      throw ServerFailure('Page not found');
    case 401:
    case 403:
      throw ServerFailure('Unauthorized request. Make sure api-key is set');
    default:
      throw ServerFailure('Unexpected error occurred, retry');
  }
}
