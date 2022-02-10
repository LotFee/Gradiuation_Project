import 'package:flutter/material.dart';
import 'package:sakkeny/widget/bottomBar.dart';

class UserProf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(



        floatingActionButton:FloatingActionButton(
          onPressed: (){

          },
          backgroundColor: Color(0xff1f95a1),
          child: Icon(Icons.add), //icon inside button
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        bottomNavigationBar: myBottomBar(index: 3,),

      ),
    );
  }
}
