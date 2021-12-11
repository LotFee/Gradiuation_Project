import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/widget/hafl_step.dart';
import 'package:sakkeny/screens/start_screen.dart';

import 'Steper2_screen.dart';



class Steper3 extends StatelessWidget {
  const Steper3({Key? key}) : super(key: key);

  static const String routeName = "steper3";

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
          HalfStep( "images/steper_2.png" ,3),

          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(

                  color: Color(0xff1f95a1), // background
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)), // foreground
                  onPressed: () {
                    Navigator.pushNamed(context, StartScreen.routeName);
                  },
                  child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 25),),
                  padding: EdgeInsets.only(top: 15,bottom: 15 , left: 45,right: 45),
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

        ],
      ),
    );
  }
}
