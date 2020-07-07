import 'package:flutter/material.dart';
import 'package:news_app/models/News.dart';

class FavouriteNews extends StatelessWidget {
  final List<Articles> articles;

  const FavouriteNews({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,)
      ),
    );
  }

}