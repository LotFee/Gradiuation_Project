import 'package:flutter/material.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'package:sakkeny/homeScreens/Home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AboutUs extends StatelessWidget {
  static const String routeName = 'about us';

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
            "About Us",
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
            padding: const EdgeInsets.all(16.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.location_on_rounded,
                        color: Color(0xff1f95a1),
                      ),
                      title: Text(
                        'Location',
                        style: TextStyle(
                          color: Color(0xff1f95a1),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'ismailia,egypt',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Color(0xff1f95a1),
                      ),
                      title: Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Color(0xff1f95a1),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          '+20 1007613790',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.link,
                        color: Color(0xff1f95a1),
                      ),
                      title: Text(
                        'Social Links',
                        style: TextStyle(
                          color: Color(0xff1f95a1),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed:(){

                                },
                                icon: Icon(
                                  Icons.facebook,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed:(){

                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed:(){

                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed:(){

                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                )),
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
