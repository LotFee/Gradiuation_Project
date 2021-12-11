import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/screens/Stepers/steper3_screen.dart';
import 'package:sakkeny/widget/hafl_step.dart';
import 'package:sakkeny/screens/Stepers/Steper2_screen.dart';

class Steper1 extends StatelessWidget {
  const Steper1({Key? key}) : super(key: key);
  static const String routeName = "step1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Color(0xff1f95a1) ),
      ),
      //appBar: AppBar(title: Text('ss'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HalfStep("images/stepper1.png" , 1),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                RaisedButton(

                  color: Color(0xff1f95a1), // background
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)), // foreground
                  onPressed: () {
                    Navigator.pushReplacement(context,PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => Steper2(),
                      transitionDuration: Duration.zero,
                    ),);
                  },
                  child: Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                    size: 35,
                  ),
                  padding: EdgeInsets.only(top: 8,bottom: 8),
                 ),
                // CircleAvatar(
                //   backgroundColor: Color(0xff1f95a1),
                //   child: Icon(
                //     Icons.arrow_forward_sharp,
                //     color: Colors.white,
                //     size: 35,
                //   ),
                // ),
              ],
            ),
          ),
          FlatButton(
            padding: EdgeInsets.all(20),
              onPressed: () {
                Navigator.pushReplacement(context,PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Steper3(),
                  transitionDuration: Duration.zero,
                ),);
              },
              child: Text(
                'Skip',
                style:
                    TextStyle(fontSize: 17 ,color: Colors.grey, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}



// Align(
// alignment: Alignment(.8,-8),
// child: IconButton(
// onPressed: (){},
// icon: Icon(Icons.arrow_forward_sharp,color: Colors.red, size: 60,  ),
// ),
// ),
