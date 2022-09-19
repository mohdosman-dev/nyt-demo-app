

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';
import 'package:nyt_app/features/articles/presentation/pages/article_details_page.dart';

class ArticlesList extends StatelessWidget {
  final List<Article> articles;

  const ArticlesList({
    Key? key, required this. articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        final article = articles.elementAt(index);
        late Media? media;
        if (article.media != null && article.media!.isNotEmpty) {
          media = article.media!.first;
        } else {
          media = null;
        }
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailsPage(article: article),
              ),
            );
          },
          title: Text(
            '${article.title}',
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
          isThreeLine: true,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
          leading: CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 75,
                height: 75,
                imageUrl: media != null
                    ? '${article.media!.first.metadata.first.url}'
                    : 'https://placehold.jp/57b6e5/ffffff/75x75.png?text=' +
                        article.title!.substring(0, 1),
                placeholder: (context, url) => Image.asset(
                  'assets/imgs/loading.gif',
                  fit: BoxFit.cover,
                  height: 75,
                  width: 75,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          subtitle: Column(
            children: [
              Text(
                '${article.content}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${article.byline}',
                    ),
                  ),
                  const SizedBox(width: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Text(DateFormat('yyyy-MM-dd')
                          .format(article.publishedDate!)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 8),
    );
  }
}
