import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/ui_helper.dart';
import 'package:flutter/material.dart';

import '../models/News.dart';
import '../utils/ui_helper.dart';
import 'widgets/article_item.dart';
import 'widgets/bottom_navigation.dart';

class PopularListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PopularListPageState();
  }
}

class PopularListPageState extends State<PopularListPage> {
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
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: articles == null
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Popular Items', style: UIHelper.headerStyle),
              Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return ArticleItem(articles[index]);
                      }
                  )
              )
            ],
          )
        )
    );
  }

}