import 'package:dartz/dartz.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';
import 'package:nyt_app/features/articles/data/repositories/article_repository.dart';

class GetAllArticlesUsercase {
  final ArticleRepositoryImpl repository;

  GetAllArticlesUsercase(this.repository);

  Future<Either<IFailure, List<Article>>> call() async {
    return await repository.getMostviewedArticles();
  }
}
