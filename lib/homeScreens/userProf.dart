import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/homeScreens/editprof.dart';


class UserProf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUserData>(context,listen: false);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          foregroundColor: Color(0xff1f95a1),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
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
                      Navigator.of(context).pushNamed(EditProf.routeName);
                    },
                  ),
                ],
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage:   NetworkImage(currentUser.currentUserDate.img) ,
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
                            currentUser.currentUserDate.fName,
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
                            currentUser.currentUserDate.lName,
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
                            currentUser.currentUserDate.gender,
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
                            currentUser.currentUserDate.age,
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
                            currentUser.currentUserDate.email,
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
