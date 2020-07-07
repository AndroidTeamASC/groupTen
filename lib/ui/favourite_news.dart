import 'package:flutter/material.dart';
import 'package:news_app/models/News.dart';

class FavouriteNews extends StatelessWidget {
  final List<Articles> articles;

  const FavouriteNews({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,),
        body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final item = articles[index];

            return ListTile(
              leading: Image.network(item.urlToImage, fit: BoxFit.fill, width: 100, height: 100,),
              title: Text(item.title),
              subtitle: Text(item.author),
            );
          }),
      ),
    );
  }

}
