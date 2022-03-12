import 'dart:async';


import 'package:flutter/material.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
class Booking extends StatefulWidget {
  static const String routeName = 'booking';

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  bool done = false ;
  bool decline = false;
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
          title: Center(
              child: Text(
                "Booking",
                style: TextStyle(
                    color: Color(0xff1f95a1), fontWeight: FontWeight.bold),
              )),
          actions: [
            GestureDetector(
                onTap: () {

                },
                child: Icon(Icons.search, color: Color(0xff1f95a1), size: 35)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: decline==true ? Text("") : Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset('images/logo_login.png'),
                        radius: 30,
                      ),
                      title:Text('hamed want to book your flat',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      trailing: Text('2m ago'),
                    ),
                    SizedBox(height: 10,),
                    done == true ? RaisedButton(
                      color:
                      Color(0xff2e2d41), // background
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              10)), // foreground
                      onPressed: () {

                      },
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                        child: Text(
                          "Done ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ) :  ListTile(
                      leading: RaisedButton(
                        color:
                        Color(0xff2e2d41), // background
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                10)), // foreground
                        onPressed: () {
                          setState(() {
                            done = ! done ;
                          });
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                          child: Text(
                            "Approve",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      trailing: RaisedButton(
                        color: Colors.red, // background
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)), // foreground
                        onPressed: () {
                          setState(() {
                            decline = !decline;
                          });

                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                          child: Text(
                            "Decline",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                      ),

                    ),



                  ],
                ),
              ),
            ),
          ),
        ),
        drawer: myDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => AddOne(),
                transitionDuration: Duration.zero,
              ),
            );
          },
          backgroundColor: Color(0xff1f95a1),
          child: Icon(Icons.add), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: myBottomBar(
          index: 10,
        ),
      ),
    );
  }
}
