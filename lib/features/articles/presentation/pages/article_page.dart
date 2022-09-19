import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/core/widgets/articles_list.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_bloc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_events.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_states.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Viewed Articles'),
        leading: const Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshArticles,
        child: BlocBuilder<ArticleBloc, IArticleState>(
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
            } else if (state is LoadedArticleState) {
              if (state.articles.isNotEmpty) {
                return Container(
                  child: _buildArticlesList(state.articles),
                );
              } else {
                return const Center(child: Text('No data'));
              }
            }

            return const Center(child: Text('Somthing went wrong..! '));
          },
        ),
      ),
    );
  }

  Widget _buildArticlesList(List<Article> articles) {
    return ArticlesList(articles: articles);
  }

  Future<void> _refreshArticles() async {
    BlocProvider.of<ArticleBloc>(context).add(GetArticlesRefreshEvent());
  }
}
