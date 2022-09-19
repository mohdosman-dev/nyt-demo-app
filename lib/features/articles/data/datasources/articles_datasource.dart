import 'package:nyt_app/core/error/exceptions.dart';
import 'package:nyt_app/core/helpers/dio_helper.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';

abstract class IArticleDatasource {
  Future<List<Article>> getMostviewedArticles(
      {String section = 'all-section', int period = 7});
}

class ArticleDatasourceImpl extends IArticleDatasource {
  //* 1- Inject DioHelper to use interceptors.
  final DioHelper _dio;

  ArticleDatasourceImpl(this._dio);

  /// Get most viewed articles in specific period
  ///* @param section default('all-section')
  ///* @param period default('all-section')
  @override
  Future<List<Article>> getMostviewedArticles(
      {String section = 'all-sections', int period = 7}) async {
    try {
      //* Request to mostviewed in section within period
      final response =
          await _dio.client.get('/mostviewed/$section/$period.json');
      final List<Article> articles = (response.data['results'] as List)
          .map((e) => Article.fromMap(e))
          .toList();
      return articles;
    } catch (e) {
      throw ServerException();
    }
  }
}
