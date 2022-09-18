// part of 'posts_bloc.dart';

import 'package:equatable/equatable.dart';

//* BloC article events
abstract class IArticleEvent extends Equatable {
  const IArticleEvent();

  @override
  List<Object> get props => [];
}

//* Get article event
//? (Emit when start fetching articles)
class GetArticlesEvent extends IArticleEvent {}

//* Get article event
//?(Emit when pull refresh indicator)
class GetArticlesRefreshEvent extends IArticleEvent {}
