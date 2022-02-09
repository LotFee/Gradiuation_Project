import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeNme='home';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        appBar: AppBar(
          foregroundColor: Color(0xff1f95a1),
          backgroundColor: Colors.white,
          backwardsCompatibility: false,
          title: Center(child: Text("Home", style: TextStyle(color:Color(0xff1f95a1),fontWeight: FontWeight.bold ),)),
          actions: [
              GestureDetector(onTap: (){},child: Icon(Icons.search,color: Color(0xff1f95a1),size: 35)),
        ],
        ),
         drawer: Drawer(

         ),
        floatingActionButton:FloatingActionButton(
          onPressed: (){

          },
          backgroundColor: Color(0xff1f95a1),
          child: Icon(Icons.add), //icon inside button
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        bottomNavigationBar: BottomAppBar(
          color:Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 7,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home, color: Color(0xff1f95a1),size: 30,), onPressed: () {},),
              IconButton(icon: Icon(Icons.favorite, color: Color(0xff1f95a1),size: 30), onPressed: () {},),
              IconButton(icon: Icon(Icons.notifications, color: Color(0xff1f95a1),size: 30), onPressed: () {},),
              IconButton(icon: Icon(Icons.person, color: Color(0xff1f95a1),size: 30), onPressed: () {},),
            ],
          ),
        ),

      ),
    );
  }
}
