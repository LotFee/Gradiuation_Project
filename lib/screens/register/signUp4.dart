import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakkeny/screens/register/signUp3.dart';

import '../../homeScreens/Home.dart';

class SignUp4 extends StatelessWidget {
  const SignUp4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Color(0xff1f95a1),
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Center(
              child: Text(
                "Final Step",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 7),
                        //  spreadRadius: 50.0,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff1f95a1)),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Color(0xff1f95a1),
                  size: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 7),
                        //  spreadRadius: 50.0,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff1f95a1)),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Color(0xff1f95a1),
                  size: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 7),
                        //  spreadRadius: 50.0,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff1f95a1)),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 80, right: 80),
              child: Image.asset(
                'images/register.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text(
                  "Congratulations, ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "you have successfully completed ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  " the registration steps ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                color: Color(0xff1f95a1), // background
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => Home(),
                      transitionDuration: Duration.zero,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Go Home",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
