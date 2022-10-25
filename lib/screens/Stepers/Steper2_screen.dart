import 'package:flutter/material.dart';
import 'package:sakkeny/screens/Stepers/steper1_screen.dart';
import 'package:sakkeny/screens/Stepers/steper3_screen.dart';
import 'package:sakkeny/widget/hafl_step.dart';
import 'package:flutter/services.dart';

class Steper2 extends StatelessWidget {
  const Steper2({Key? key}) : super(key: key);
  static const String routeName="steper2_screen";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
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
            HalfStep( "assets/stepper2.png" ,2),

            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(

                    color: Color(0xff1f95a1), // background
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)), // foreground
                    onPressed: () {
                      Navigator.pushReplacement(context,PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => Steper1(),
                        transitionDuration: Duration.zero,
                      ),);
                    },
                    child: Icon(
                      Icons.arrow_back_sharp  ,
                      color: Colors.white,
                      size: 35,
                    ),
                    padding: EdgeInsets.only(top: 8,bottom: 8),
                  ),

                  RaisedButton(

                    color: Color(0xff1f95a1), // background
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)), // foreground
                    onPressed: () {
                      Navigator.pushReplacement(context,PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => Steper3(),
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
                  TextStyle(fontSize: 17,color: Colors.grey, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
