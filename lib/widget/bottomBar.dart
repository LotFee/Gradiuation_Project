import 'package:flutter/material.dart';
import 'package:sakkeny/homeScreens/favScreen.dart';

import 'package:sakkeny/homeScreens/notiScreen.dart';
import 'package:sakkeny/homeScreens/userProf.dart';
import 'package:sakkeny/homeScreens/Home.dart';

class myBottomBar extends StatelessWidget {
  const myBottomBar({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 7,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: index == 0 ? Color(0xff1f95a1) : Colors.grey,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Home(),
                  transitionDuration: Duration.zero,
                ),);
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite,
                  color: index == 1 ? Color(0xff1f95a1) : Colors.grey,
                  size: 30),
              onPressed: () {
                Navigator.pushReplacement(context,PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => FavScreen(),
                  transitionDuration: Duration.zero,
                ),);
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications,
                  color: index == 2 ? Color(0xff1f95a1) : Colors.grey,
                  size: 30),
              onPressed: () {
                Navigator.pushReplacement(context,PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => NotiScreen(),
                  transitionDuration: Duration.zero,
                ),);
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications,
                  color: index == 3 ? Color(0xff1f95a1) : Colors.grey,
                  size: 30),
              onPressed: () {
                Navigator.pushReplacement(context,PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => UserProf(),
                  transitionDuration: Duration.zero,
                ),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
