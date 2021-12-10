import 'package:flutter/material.dart';
import 'screens/steper1_screen.dart';

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
      routes: {
        Steper1.stepOneRouteName : (ctx)=> Steper1(),
      },
      home: Steper1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
