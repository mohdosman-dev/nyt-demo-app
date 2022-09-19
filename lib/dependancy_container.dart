import 'package:get_it/get_it.dart';
import 'package:nyt_app/core/helpers/dio_helper.dart';
import 'package:nyt_app/features/articles/data/datasources/articles_datasource.dart';
import 'package:nyt_app/features/articles/data/repositories/article_repository.dart';
import 'package:nyt_app/features/articles/domain/repositories/article_repository_interface.dart';
import 'package:nyt_app/features/articles/domain/usecases/get_all_articles.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_bloc.dart';

final GetIt instance = GetIt.instance;

Future<void> init() async {
  //! Features - articles

  //* Bloc injections
  instance.registerFactory(() => ArticleBloc(instance()));


  //* Datasource injections
  instance.registerLazySingleton<IArticleDatasource>(
      () => ArticleDatasourceImpl(instance()));

  //* Repositories injections
  instance.registerLazySingleton<IArticleRepositroy>(
      () => ArticleRepositoryImpl(instance()));

      
  //* Usecases injections
  instance.registerLazySingleton(
      () => GetAllArticlesUsecase(instance()));

  //* Core
  instance.registerLazySingleton(() => DioHelper());
}
