import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/ui_helper.dart';
import 'package:flutter/material.dart';

import '../models/News.dart';
import '../utils/ui_helper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: [
          Text('News', style: UIHelper.headerStyle),
          CardList(),
          Column(children: [
            Text('Popular', style: UIHelper.subHeaderStyle),
            RaisedButton(child: Text('see all', style: TextStyle(color: Colors.white)), color: UIHelper.themeColor, onPressed: () {})
          ])
        ],
      ),
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
  News news;
  var url = "http://newsapi.org/v2/top-headlines?country=us&apiKey=bf11b1d2ccd94155bdffe2d638d2540d";

  fetchData() async {
    var data = await http.get(url);
    var json = jsonDecode(data.body);
    news = News.fromJson(json);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: news.articles.length,
      itemBuilder: (context, index) {
        return CardView(news.articles[index]);
      }
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
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Image.network("http://menu-order.khaingthinkyi.me/storage/image/5ee2f782becb81591932802.png", fit: BoxFit.fill),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(icon: Icon(Icons.favorite), onPressed: () {})
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Text(articles.title, style: UIHelper.subHeaderStyle)
          )
        ]
      ),
    );
  }
}