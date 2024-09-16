import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/models/News.dart';
import 'package:news_app/extensions.dart';

import 'news_details.dart';


class NewsWidget extends StatelessWidget {
  News? news;
  NewsWidget(this.news,{super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,
        arguments: news);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              imageUrl: news?.urlToImage ??"",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10,),
          Text(news?.author??""),
          SizedBox(height: 10,),
          Text("${news?.title}",
            style: TextStyle(
                fontSize: 18
            ),),
          SizedBox(height: 10,),
          Text("${news?.publishedAt?.formatNewsDate()}",
            textAlign: TextAlign.end,)
        ],
      ),
    );
  }
}