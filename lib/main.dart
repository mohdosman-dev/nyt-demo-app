import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_bloc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles/article_events.dart';
import 'package:nyt_app/features/articles/presentation/pages/article_page.dart';
import 'dependancy_container.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleBloc>(
          create: (context) =>
              di.instance<ArticleBloc>()..add(GetArticlesEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'NYT Demo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ArticlesPage(),
      ),
    );
  }
}
