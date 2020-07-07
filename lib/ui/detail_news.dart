import 'package:flutter/material.dart';
import 'package:news_app/models/News.dart';
import 'package:news_app/utils/storage_service.dart';
import 'package:news_app/utils/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation.dart';

class DetailNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class DetaisNewState extends State<DetailNews> {

  final Articles articles;

  DetaisNewState(this.articles);


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
                  child: IconButton(icon: Icon(Icons.favorite), 
                  onPressed: () async {
                    
                    
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Saved as Favourite!"),
                      duration: const Duration(milliseconds: 500),
                      ));

                  }),
                ),
              ],
            ),
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
          ],
        )),
      ),
    );
  }

}

