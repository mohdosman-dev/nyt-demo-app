import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';
import 'package:nyt_app/features/articles/domain/repositories/article_repository_interface.dart';
import 'package:nyt_app/features/articles/domain/usecases/get_all_articles.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_bloc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_events.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_states.dart';

class MockRepository extends Mock implements IArticleRepositroy {}

void main() {
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
  });

  group('Get Articles', () {
    final List<Article> mockArticles = [
      Article(title: 'Test 1', content: 'Test 1 content'),
      Article(title: 'Test 2', content: 'Test 2 content'),
      Article(title: 'Test 3', content: 'Test 3 content'),
      Article(title: 'Test 4', content: 'Test 4 content'),
    ];

    //* Test right side of either
    //? When have data
    blocTest(
      'Test article BLoC with data',
      build: () {
        when(mockRepository.getMostviewedArticles())
            .thenAnswer((realInvocation) async => right(
                  mockArticles,
                ));
        return ArticleBloc(GetAllArticlesUsecase(mockRepository));
      },
      act: (bloc) => (bloc as Bloc).add(GetArticlesEvent()),
      expect: () => [
        InitalArticleState(),
        LoadingArticleState(),
        LoadedArticleState(mockArticles),
      ],
    );

    //* Test left side of either
    //? When have an error
    /* blocTest(
      'Test article BLoC with error',
      build: () {
        when(mockRepository.getMostviewedArticles())
            .thenThrow((realInvocation) async => 
                  ServerFailure('Error occure'),
                );
        return ArticleBloc(GetAllArticlesUsecase(mockRepository));
      },
      act: (bloc) => (bloc as Bloc).add(GetArticlesEvent()),
      expect: () => [
        LoadingArticleState(),
        const ErrorArticleState('Error occure'),
      ],
    ); */
  });
}
