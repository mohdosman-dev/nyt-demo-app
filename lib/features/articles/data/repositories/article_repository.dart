import 'package:flutter/foundation.dart';
import 'package:nyt_app/features/articles/data/datasources/articles_datasource.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:nyt_app/features/articles/domain/repositories/article_repository_interface.dart';

class ArticleRepositoryImpl extends IArticleRepositroy {
  //* Article datasource
  final IArticleDatasource datasource;

  ArticleRepositoryImpl(this.datasource);

  /// Get most viewed articles in specific period
  ///* @param section default('all-section')
  ///* @param period default('all-section')
  @override
  Future<Either<IFailure, List<Article>>> getMostviewedArticles(
      {String section = 'all-sections', int period = 7}) async {
    try {
      final List<Article> articles = await datasource.getMostviewedArticles(
        section: section,
        period: period,
      );
      return right(articles);
    } on Exception catch (e) {
      debugPrint('Error: $e');
      return left(ServerFailure('Error happend'));
    }
  }
}
