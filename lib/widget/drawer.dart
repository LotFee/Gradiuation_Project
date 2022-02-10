import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}