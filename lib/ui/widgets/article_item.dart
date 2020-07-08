import 'package:news_app/utils/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../models/News.dart';
import '../../ui/detail_news.dart';

class ArticleItem extends StatefulWidget {
  final Articles articles;
  ArticleItem(this.articles);

  @override
  State<StatefulWidget> createState() {
    return ArticleItemState(articles);
  }
}

class ArticleItemState extends State<ArticleItem> {
  Articles articles;
  ArticleItemState(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailNews(articles: articles)));
            },
            child: Row(
                children: [
                  Flexible(
                      child: articles.urlToImage == null
                          ? Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQdegjeAZ4eIPX5M31JtBYbW8rYsUrkmrVpog&usqp=CAU', fit: BoxFit.fill, height: 100, width: 130)
                          : Image.network(articles.urlToImage, fit: BoxFit.fill, height: 100, width: 130),
                      flex: 0,
                      fit: FlexFit.loose
                  ),
                  SizedBox(width: 20),
                  Flexible(child: Text(articles.title, maxLines: 3), flex: 1, fit: FlexFit.tight)
                ]
            )
        )
    );
  }
}