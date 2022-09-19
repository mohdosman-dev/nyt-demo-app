import 'package:dartz/dartz.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';
import 'package:nyt_app/features/articles/domain/repositories/article_repository_interface.dart';

class GetAllArticlesUsecase {
  final IArticleRepositroy repository;

  GetAllArticlesUsecase(this.repository);

  Future<Either<IFailure, List<Article>>> call() async {
    return await repository.getMostviewedArticles();
  }
}
