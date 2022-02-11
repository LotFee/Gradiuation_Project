import 'package:flutter/material.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/homeScreens/editprof.dart';

class UserProf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          foregroundColor: Color(0xff1f95a1),
          backgroundColor: Colors.white,
          backwardsCompatibility: false,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 145),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: Color(0xff1f95a1)),
                    onPressed: () {
                      Navigator.pushReplacement(context,PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => EditProf(),
                      transitionDuration: Duration.zero,));
                    },
                  ),
                ],
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/startScreen.png'),
                    radius: 70,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xfff1f1f1),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Color(0xff1f95a1),
                          ),
                          title: Text(
                            'hamed',
                            style: TextStyle(
                              color: Color(0xff1f95a1),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Color(0xff1f95a1),
                          ),
                          title: Text(
                            'ahmed',
                            style: TextStyle(
                              color: Color(0xff1f95a1),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.male,
                            color: Color(0xff1f95a1),
                          ),
                          title: Text(
                            'male',
                            style: TextStyle(
                              color: Color(0xff1f95a1),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.calendar_today,
                            color: Color(0xff1f95a1),
                          ),
                          title: Text(
                            '22',
                            style: TextStyle(
                              color: Color(0xff1f95a1),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Color(0xff1f95a1),
                          ),
                          title: Text(
                            'hamed@gmail.com',
                            style: TextStyle(
                              color: Color(0xff1f95a1),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.lock,
                            color: Color(0xff1f95a1),
                          ),
                          title: Text(
                            '*******',
                            style: TextStyle(
                              color: Color(0xff1f95a1),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
                //   child: Material(
                //     borderRadius: BorderRadius.circular(10.0),
                //     color: Color(0xff1f95a1),
                //     child: MaterialButton(
                //       child: Text(
                //         'Save',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20,
                //         ),
                //       ),
                //       onPressed: () {},
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: myBottomBar(
          index: 3,
        ),
      ),
    );
  }
}
