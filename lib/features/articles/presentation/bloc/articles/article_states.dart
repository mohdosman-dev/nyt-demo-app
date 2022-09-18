import 'package:equatable/equatable.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';

abstract class IArticleState extends Equatable {
  const IArticleState();
  @override
  List<Object> get props => [];
}

//* Inital state
class InitalArticleState extends IArticleState {}

//* Loading article state
class LoadingArticleState extends IArticleState {}

//* After fetch data state
class LoadedArticleState extends IArticleState {
  final List<Article> articles;

  const LoadedArticleState(this.articles);

  @override
  List<Object> get props => [articles];
}

//* After fetch data and error occured
class ErrorArticleState extends IArticleState {
  final String message;

  const ErrorArticleState(this.message);

  @override
  List<Object> get props => [message];
}
