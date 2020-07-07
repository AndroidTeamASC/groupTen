import 'package:flutter/material.dart';

class UIHelper {

  static const TextStyle headerStyle = TextStyle(
    fontSize: 35, fontWeight: FontWeight.w900, color: Colors.black45
  );
  static const TextStyle subHeaderStyle = TextStyle(
    fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black45
  );

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
