import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/News.dart';
import 'package:news_app/utils/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/bottom_navigation.dart';

class DetailNews extends StatefulWidget {
  Articles articles;

  DetailNews({this.articles});

  @override
  State<StatefulWidget> createState() {
    return DetailsNewState(articles);
  }
}

class DetailsNewState extends State<DetailNews> {
  final Articles articles;

  DetailsNewState(this.articles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  this.articles.urlToImage == null
                      ? Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQdegjeAZ4eIPX5M31JtBYbW8rYsUrkmrVpog&usqp=CAU', fit: BoxFit.fill, height: 300)
                      : Image.network(articles.urlToImage, fit: BoxFit.fill, height: 300),
                  AppBar(
                      backgroundColor: Colors.transparent,
                      leading: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      actions: <Widget>[
                        IconButton(
                            icon: Icon(Icons.favorite),
                            onPressed: () async {
                              SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              bool checkValue = prefs.containsKey("news");

                              if (checkValue == false) {
                                prefs.setString("news", jsonEncode(articles));

                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Saved as Favourite!"),
                                  duration: const Duration(milliseconds: 500),
                                ));
                              } else {
                                prefs.remove("news");
                              }
                            })
                      ],
                      elevation: 0,
                    )
                ],
              ),
              Container(margin: EdgeInsets.all(20), child: Text(articles.title, style: UIHelper.subHeaderStyle)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: articles.description == null
                  ? Text('No Description', style: UIHelper.normalTextStyle)
                  : Text(articles.description, style: UIHelper.normalTextStyle)
              ),
            ]
          )
        )
      ),
    );
  }
}