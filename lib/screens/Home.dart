import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
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
          title: Center(child: Text("Home", style: TextStyle(color:Color(0xff1f95a1),fontWeight: FontWeight.bold ),)),
          actions: [
              GestureDetector(onTap: (){},child: Icon(Icons.search,color: Color(0xff1f95a1),size: 35)),
        ],
        ),
         drawer: ClipRRect(
           borderRadius: BorderRadius.only(
               topRight: Radius.circular(80), bottomRight: Radius.circular(35)),
           child: Drawer(

             child: ListView(
               children: [
                 Container(
                   height: 200,
                   child: DrawerHeader(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CircleAvatar(
                             radius: 55,
                             backgroundColor: Colors.white,
                             child: Image.asset('images/logo_login.png'),
                           ),
                           Text("Lotfee",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xff1f95a1) ),),
                           Text("sakkeny@gmail.com",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold  ),)
                         ],
                       )),
                 ),
                 Column(
                   children: [
                     ListTile(
                       tileColor: Color(0xfff1f1f1),
                       leading: Icon(Icons.add,color:Color(0xff1f95a1) ,),
                       onTap: (){

                       },
                       title: Text(
                         'Posts',
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                     SizedBox(height: 10,),
                     ListTile(
                       tileColor: Color(0xfff1f1f1),
                       leading: Icon(Icons.home,color:Color(0xff1f95a1) ,),
                       onTap: (){

                       },
                       title: Text(
                         'Reserved Estates',
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                     SizedBox(height: 10,),
                     ListTile(
                       tileColor: Color(0xfff1f1f1),
                       leading: Icon(Icons.bookmark,color:Color(0xff1f95a1) ,),
                       onTap: (){

                       },
                       title: Text(
                         'Booking',
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                     SizedBox(height: 10,),
                     ListTile(
                       tileColor: Color(0xfff1f1f1),
                       leading: Icon(Icons.people_rounded,color:Color(0xff1f95a1) ,),
                       onTap: (){

                       },
                       title: Text(
                         'About Us',
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                     SizedBox(height: 10,),
                     ListTile(
                       tileColor: Color(0xfff1f1f1),
                       leading: Icon(Icons.archive,color:Color(0xff1f95a1) ,),
                       onTap: (){

                       },
                       title: Text(
                         'Complaints',
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                     SizedBox(height: 10,),
                     ListTile(
                       tileColor: Color(0xfff1f1f1),
                       leading: Icon(Icons.security,color:Color(0xff1f95a1) ,),
                       onTap: (){

                       },
                       title: Text(
                         'Terms and Conditions',
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                     SizedBox(height: 10,),
                     ListTile(
                       tileColor: Color(0xfff1f1f1),
                       leading: Icon(Icons.language,color:Color(0xff1f95a1) ,),
                       onTap: (){

                       },
                       title: Text(
                         'Language',
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                     SizedBox(height: 10,),
                     ListTile(
                       tileColor: Color(0xfff1f1f1),
                       leading: Icon(Icons.login_outlined,color:Color(0xff1f95a1) ,),
                       onTap: (){

                       },
                       title: Text(
                         'Log Out',
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                   ],
                 ),

               ],
             ),
           ),
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
          child: Padding(
            padding: EdgeInsets.all(10),
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

      ),
    );
  }
}
