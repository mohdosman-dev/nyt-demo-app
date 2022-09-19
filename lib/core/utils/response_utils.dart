
import 'package:dio/dio.dart';
import 'package:nyt_app/core/error/failures.dart';

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
