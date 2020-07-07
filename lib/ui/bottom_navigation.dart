import 'package:flutter/material.dart';
import 'package:news_app/utils/ui_helper.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavState();
  }

}

class BottomNavState extends State<BottomNavigation> {
  
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.transparent
    ),
    body: Center(
      child: UIHelper.navWidgetOption.elementAt(selectedIndex),
    ),

    bottomNavigationBar: BottomNavigationBar(
    items: const<BottomNavigationBarItem> [
      BottomNavigationBarItem(icon: Icon(Icons.home)),
      BottomNavigationBarItem(icon: Icon(Icons.favorite))
    ],
    currentIndex: 0,
    selectedItemColor: UIHelper.themeColor,
    onTap: onItemTapped,
    )
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

}