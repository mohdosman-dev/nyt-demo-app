import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_bloc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_states.dart';

class ArticlesPage extends StatefulWidget {
  ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Viewed Articles'),
      ),
      body: BlocBuilder<ArticleBloc, IArticleState>(
        builder: (context, state) {
          if (state is LoadingArticleState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorArticleState) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
