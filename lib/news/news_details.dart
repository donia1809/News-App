import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/extensions.dart';
import 'package:news_app/theming/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/models/News.dart';
import '../theming/theme.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news_details';

  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute
        .of(context)!
        .settings
        .arguments as News;
    return Stack(children: [
      Container(
        color: Colors.white,
        child: Image.asset(
          'assets/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('News Details', style: MyThemeData.titleMedium),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                  imageUrl: news.urlToImage ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(news.author ?? ""),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${news.title}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${news.publishedAt?.formatNewsDate()}",
                textAlign: TextAlign.end,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Text(news.content ?? ''),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              'View Full Article ',
                              style: MyThemeData.bodyMedium
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              _launchUrl(news.url);
                            },
                          ),
                          InkWell(
                              onTap: () {
                                _launchUrl(news.url);
                              },
                              child: Icon(Icons.keyboard_arrow_right_rounded,
                                color: AppColors.black,)),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    ]);
  }

  Future<void> _launchUrl(newsUrl) async {
    final Uri _url = Uri.parse(newsUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}