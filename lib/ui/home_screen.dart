import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/ui/widgets/article_item.dart';
import 'package:news_app/utils/ui_helper.dart';
import 'package:flutter/material.dart';

import 'popular_list.dart';
import 'widgets/bottom_navigation.dart';
import '../models/News.dart';
import '../utils/ui_helper.dart';
import 'detail_news.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(20), child: Text('News', style: UIHelper.headerStyle)),
            CardList(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular', style: UIHelper.subHeaderStyle),
                  RaisedButton(
                      child: Text('see all', style: TextStyle(color: Colors.white)),
                      color: UIHelper.themeColor,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PopularListPage()));
                      }
                  )
                ]
              ),
            ),
            PopularList(),
          ]
        )
      )
    );
  }
}

class CardList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CardListState();
  }
}

class CardListState extends State<CardList> {
  List<Articles> articles;

  fetchData() async {
    var data = await http.get(UIHelper.BASE_URL);
    var json = jsonDecode(data.body);
    articles = News.fromJson(json).articles;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return  articles == null
    ? Center(child: CircularProgressIndicator())
    : Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return CardView(articles[index]);
          }
        )
    );
  }
}

class CardView extends StatefulWidget {
  final Articles articles;
  CardView(this.articles);

  @override
  State<StatefulWidget> createState() {
    return CardViewState(articles);
  }
}

class CardViewState extends State<CardView> {
  Articles articles;
  CardViewState(this.articles);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailNews(articles: articles)));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        margin: EdgeInsets.all(3),
        child: Stack(
          children: [
            articles.urlToImage == null
                ? Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQdegjeAZ4eIPX5M31JtBYbW8rYsUrkmrVpog&usqp=CAU', fit: BoxFit.fill, height: 200, width: 200)
                : Image.network(articles.urlToImage, fit: BoxFit.fill, height: 200, width: 200),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  icon: Icon(Icons.favorite, color: true ? Colors.white : Colors.red),
                  onPressed: () {

                  }
              ),
            ),
            Positioned(
                bottom: 10,
                left: 16,
                child: Text(articles.source.name, style: UIHelper.imageTextStyle)
            )
          ]
        )
      )
    );
  }
}

class PopularList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PopularListState();
  }
}

class PopularListState extends State<PopularList> {
  List<Articles> articles;

  fetchData() async {
    var data = await http.get(UIHelper.BASE_URL);
    var json = jsonDecode(data.body);
    articles = News.fromJson(json).articles;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return articles == null
    ? Center(child: CircularProgressIndicator())
    : Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ArticleItem(articles[index]);
        }
      )
    );
  }

}