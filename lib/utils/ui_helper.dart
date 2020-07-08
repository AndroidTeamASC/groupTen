import 'package:flutter/material.dart';

class UIHelper {
  static const String BASE_URL = "http://newsapi.org/v2/top-headlines?country=us&apiKey=bf11b1d2ccd94155bdffe2d638d2540d";

  static const TextStyle headerStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle subHeaderStyle = TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black);
  static const TextStyle normalTextStyle = TextStyle(fontSize: 17, color: Colors.black);
  static const TextStyle imageTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);

  static const Color themeColor = Color.fromRGBO(255, 0, 0, 0.5);

  static const List<Widget> navWidgetOption = <Widget>[
    Text(
      'Home',
      style: subHeaderStyle,
    ),
    Text(
      'Favourite',
      style: subHeaderStyle,
    )
  ];
}