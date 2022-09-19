import 'package:dartz/dartz.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';

abstract class IArticleRepositroy {
  Future<Either<IFailure, List<Article>>> getMostviewedArticles(
      {String section = 'all-section', int period = 7});
}
