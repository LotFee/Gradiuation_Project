import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Steper1 extends StatelessWidget {
  const Steper1({Key? key}) : super(key: key);
  static const stepOneRouteName = "step1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      //appBar: AppBar(title: Text('ss'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(

              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                        child: Text(
                      "Title",
                      style: TextStyle(
                          color: Color(0xff1f95a1),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'images/Group_124.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sakkeny Application  is healp you to find your flat ',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xff1f95a1),
                          )),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Color(0xff1f95a1), shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 10,
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
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                RaisedButton(

                  color: Color(0xff1f95a1), // background
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)), // foreground
                  onPressed: () {},
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
              onPressed: () {},
              child: Text(
                'Skip',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
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
