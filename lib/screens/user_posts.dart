import 'package:flutter/material.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'package:sakkeny/screens/search/search and filter.dart';
import 'package:sakkeny/widget/flats_grid.dart';

class UserPosts extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        appBar: AppBar(
          foregroundColor: Color(0xff1f95a1),
          backgroundColor: Colors.white,
          backwardsCompatibility: false,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xff1f95a1),
                  size: 37, // Changing Drawer Icon Size
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Center(child: Text("Your Posts", style: TextStyle(color:Color(0xff1f95a1),fontWeight: FontWeight.bold ),)),
          actions: [
            GestureDetector(onTap: (){
              Navigator.push(context,PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => SearchFilter(),
                transitionDuration: Duration.zero,
              ),);
            },child: Icon(Icons.search,color: Color(0xff1f95a1),size: 35)),
          ],
        ),
        body: FlatsGrid(index: 2),
        drawer: myDrawer(),
        floatingActionButton:FloatingActionButton(
          onPressed: (){
            Navigator.pushReplacement(context,PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => AddOne(),
              transitionDuration: Duration.zero,
            ),);
          },
          backgroundColor: Color(0xff1f95a1),
          child: Icon(Icons.add), //icon inside button
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        bottomNavigationBar: myBottomBar(index: 5,),

      ),
    );
  }
}