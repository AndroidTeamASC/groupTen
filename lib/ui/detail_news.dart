import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/News.dart';
import 'package:news_app/utils/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_navigation.dart';

class DetailNews extends StatefulWidget {
  final Articles articles;

  const DetailNews({this.articles});

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
      body: Center(
        child: Container(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400.0,
                  width: 400.0,
                  child: Image.network(
                    this.articles.urlToImage,
                    fit: BoxFit.fill,
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  elevation: 0,
                ),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: IconButton(
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
                      }),
                ),
              ],
            ),
            Container(
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(children: [
                    SizedBox(height: 10.0),
                    Text(
                      this.articles.description,
                      style: UIHelper.subHeaderStyle,
                    ),
                  ]),
                ),
                BottomNavigation(),
              ]),
            )
          ],
        )),
      ),
    );
  }
}
