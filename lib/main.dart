import 'package:flutter/material.dart';
import 'package:sakkeny/screens/register/signup1.dart';
import 'package:sakkeny/screens/login_screen.dart';
import 'package:sakkeny/screens/start_screen.dart';
import 'screens/Stepers/steper1_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/forget_password/forget1.dart';
import 'screens/forget_password/forget2.dart';
import 'screens/forget_password/forget3.dart';
import 'package:sakkeny/homeScreens/Home.dart';

// 0xff1f95a1

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      initialRoute:WelcomeScreen.routeName ,
      routes: {
        WelcomeScreen.routeName:(ctx)=>WelcomeScreen(),
        Steper1.routeName: (ctx)=> Steper1(),
        StartScreen.routeName:(ctx)=>StartScreen(),
        SignUp1.routeName:(ctx)=>SignUp1(),
        LoginScreen.routeName:(ctx)=>LoginScreen(),
        ForgetOne.routeName:(ctx)=>ForgetOne(),
        ForgetTwo.routeName:(ctx)=>ForgetTwo(),
        ForgetThree.routeName:(ctx)=>ForgetThree(),
        Home.routeNme:(ctx)=>Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
