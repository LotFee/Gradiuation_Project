import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = 'start_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Image.asset(
              'images/startScreen.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff1f95a1),
              child: MaterialButton(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                },
              ),
            ),
          ),
          Center(
            child: Text(
              'OR',
              style: TextStyle(
                color: Color(0xff2f2e41),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff2f2e41),
              child: MaterialButton(
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
