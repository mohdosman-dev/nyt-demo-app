import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nyt_app/features/articles/data/models/artical_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleDetailsPage extends StatefulWidget {
  final Article article;

  const ArticleDetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopContent(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.article.content}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final link = widget.article.url;
                      try {
                        if (link != null && await canLaunchUrlString(link)) {
                          await launchUrlString(link);
                        }
                      } catch (e) {
                        debugPrint('Ex when launch link: ($link): #e');
                      }
                    },
                    child: const Text('Visit article website'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopContent() {
    late Media? media;
    if (widget.article.media != null && widget.article.media!.isNotEmpty) {
      media = widget.article.media!.first;
    } else {
      media = null;
    }
    return Stack(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .40,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: media != null
                ? '${widget.article.media!.first.metadata.first.url}'
                : 'https://placehold.jp/57b6e5/ffffff/75x75.png?text=' +
                    widget.article.title!.substring(0, 1),
            placeholder: (context, url) => Image.asset(
              'assets/imgs/loading.gif',
              fit: BoxFit.cover,
              height: 75,
              width: 75,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .40,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.70)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: kToolbarHeight),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.article,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    SizedBox(
                      width: 90.0,
                      child: Divider(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '${widget.article.title}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '${widget.article.byline}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            DateFormat('yyyy-MM-dd')
                                .format(widget.article.publishedDate!),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
