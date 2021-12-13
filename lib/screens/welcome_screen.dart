import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'Stepers/steper1_screen.dart';


class WelcomeScreen extends StatefulWidget {
  static const String routeName= 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController ?controller;
  Animation ?animation;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      upperBound: 70,
    );
    animation = ColorTween(begin: Colors.white, end: Colors.white).animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
    new Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Steper1()),
        ));
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Color(0xff1f95a1) ),
      ),
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png',width: 150 , height: 150,),
                  ),
                ),
                SizedBox(height:20,),
                TyperAnimatedTextKit(
                  speed: Duration(milliseconds: 200),
                  text: ['SAKKENY'],
                  textStyle: TextStyle(
                    color: Color(0xFF1F95A1),
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
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
