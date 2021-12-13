import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeNme='home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Coming soon" ,style: TextStyle(color:Color(0xff1f95a1) ,fontSize: 30,fontWeight: FontWeight.bold ),),
        ),
      ),
    );
  }
}
