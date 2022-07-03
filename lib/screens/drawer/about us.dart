import 'package:flutter/material.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/screens/ourLocation.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'package:sakkeny/homeScreens/Home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = 'about us';

  @override
  Widget build(BuildContext context) {
    Future launcApp(int index)async {
      if(index == 0)
        {
          var whatsappUrl =
              "whatsapp://send?phone=+201007613790&text=مرحبا ...كيف حالك؟";
          var url = Uri.parse(whatsappUrl);
          await launchUrl(url);
        }
      if(index==1)
        {
          await launchUrl(Uri.parse("tel://+201007613790"));
        }

    }
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
                onTap: () {},
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OurLocation()));
                      },
                      child: ListTile(
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (true) {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => Container(
                                    child: Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      elevation: 16,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          width: 100,
                                          height: 150,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      launcApp(0);
                                                    },
                                                    icon: Icon(Icons.whatsapp),
                                                    iconSize: 50,
                                                    color: Color(0xff1f95a1),
                                                  ),
                                                  Text(
                                                    "Whatsapp",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      launcApp(1);
                                                    },
                                                    icon: Icon(Icons.phone),
                                                    iconSize: 50,
                                                    color: Color(0xff1f95a1),
                                                  ),
                                                  Text(
                                                    "Phone",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                        }


                      },
                      child: ListTile(
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
                                onPressed: ()async {
                                  await launchUrl(Uri.parse('fb://profile/100008429404155'));
                                },
                                icon: Icon(
                                  Icons.facebook,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () async{
                                  await launchUrl(Uri.parse('instagram://user?username=_l0tfee_'));
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: ()async {
                                  await launchUrl(Uri.parse('twitter://user?screen_name=m_lotfee'));
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
