import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/homeScreens/userProf.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:sakkeny/screens/drawer/about us.dart';
import 'package:sakkeny/screens/drawer/booking.dart';
import 'package:sakkeny/screens/drawer/complaints.dart';
import 'package:sakkeny/screens/drawer/terms and conditions.dart';
import 'package:sakkeny/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class myDrawer extends StatelessWidget {
  const myDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentuser = Provider.of<CurrentUserData>(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(80), bottomRight: Radius.circular(35)),
      child: Drawer(

        child: ListView(
          children: [
            Container(
              height: 200,
              child: GestureDetector(
                onTap: (){ Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => UserProf()),
                        (route) => false);},
                child: DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 55,

                           backgroundImage:   NetworkImage(currentuser.currentUserDate.img) ,
                        ),
                        Text(currentuser.currentUserDate.fName +" "+ currentuser.currentUserDate.lName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xff1f95a1) ),),
                        Text(currentuser.currentUserDate.email,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold  ),)
                      ],
                    )),
              ),
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
                    Navigator.pushNamed(context, Booking.routeName);
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
                    Navigator.pushNamed(context, AboutUs.routeName);
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
                    Navigator.pushNamed(context, Complaint.routeName);
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
                    Navigator.pushNamed(context, Terms.routeName);
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
                  onTap: () async{
                    SharedPreferences pref =await SharedPreferences.getInstance();
                    pref.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
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
    );
  }
}