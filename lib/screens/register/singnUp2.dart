import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/screens/register/signUp3.dart';
import 'package:sakkeny/screens/register/signup1.dart';


class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  String gender ="None";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
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
              SizedBox(height: 20,),
              Center(
                child: Text(
                  "Second Step",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 15,),
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
                            shape: BoxShape.circle,
                            color: Color(0xff1f95a1)
                        ),
                        child: Icon(Icons.done , color: Colors.white, size: 30,) ,


                      ),
                    ),
                  ),
                  Icon(Icons.arrow_right_alt_outlined, color: Color(0xff1f95a1),size: 30,),
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
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                        child: Icon(Icons.done , color: Colors.grey, size: 30,) ,


                      ),
                    ),
                  ),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.grey,size: 30,),
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
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                        child: Icon(Icons.done , color: Colors.grey, size: 30,) ,


                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20.0,
                                offset: Offset(0.0, 7),
                                //  spreadRadius: 50.0,
                              )
                            ],
                          ),

                          child: Container(
                            color: Colors.white,
                            child: TextFormField(

                              readOnly: true,
                              decoration: InputDecoration(
                                suffixIcon: PopupMenuButton(
                                  onSelected: ( v){
                                    setState(() {
                                      gender= v.toString() ;
                                    });
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text('Male'),
                                      value: 'Male',
                                    ),
                                    PopupMenuItem(
                                      child: Text('Female'),
                                      value: 'Female',

                                    ),
                                  ],
                                  icon: Icon(Icons.keyboard_arrow_down),
                                ),
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon( Icons.wc_sharp,color: Color(0xff1f95a1),),
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey  ),
                                ),
                                hintText: gender,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Age",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20.0,
                                offset: Offset(0.0, 7),
                                //  spreadRadius: 50.0,
                              )
                            ],
                          ),

                          child: Container(
                            color: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon( Icons.animation,color: Color(0xff1f95a1),),
                                //  labelText: "Enter Your  First Name",
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(

                                  // borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey  ),
                                ),
                                hintText: "Enter Your Age",

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                )),
              ),
              SizedBox(height: 100,),
             Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(

                      color: Color(0xff1f95a1), // background
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)), // foreground
                      onPressed: () {
                        Navigator.pushReplacement(context,PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => SignUp1(),
                          transitionDuration: Duration.zero,
                        ),);
                      },
                      child: Text("Back",style: TextStyle(color: Colors.white ,fontSize: 25),),
                      padding: EdgeInsets.only(top: 8,bottom: 8),
                    ),
                    RaisedButton(

                      color: Color(0xff1f95a1), // background
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)), // foreground
                      onPressed: () {
                        Navigator.pushReplacement(context,PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => SignUp3(),
                          transitionDuration: Duration.zero,
                        ),);
                      },
                      child: Text("Next",style: TextStyle(color: Colors.white ,fontSize: 25),),
                      padding: EdgeInsets.only(top: 8,bottom: 8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

