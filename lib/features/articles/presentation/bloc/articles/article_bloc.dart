import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/domain/usecases/get_all_articles.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_events.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_states.dart';

class ArticleBloc extends Bloc<IArticleEvent, IArticleState> {
  final GetAllArticlesUsecase getAllArticles;

  ArticleBloc(this.getAllArticles) : super(InitalArticleState()) {
    on((event, emit) async {
      if (event is GetArticlesEvent) {
        //* If current event is get articles, then emit loading state
        emit(LoadingArticleState());

        final result = await getAllArticles();
        emit(_mapArticleOrFailure(result));
      } else if (event is GetArticlesRefreshEvent) {
        emit(LoadingArticleState());
        final result = await getAllArticles();
        emit(_mapArticleOrFailure(result));
      }
    });
  }

  IArticleState _mapArticleOrFailure(Either<IFailure, List<Article>> either) {
    return either.fold(
      (l) => ErrorArticleState(l.message!),
      (r) => LoadedArticleState(r),
    );
  }
}
