import 'package:flutter/material.dart';
import 'package:sakkeny/screens/register/signUp4.dart';
import 'package:sakkeny/screens/register/signUp2.dart';


class SignUp3 extends StatefulWidget {
  const SignUp3({Key? key}) : super(key: key);

  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  bool notvisible = true;
  bool notvisible2 = true;
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
                  "Third Step",
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
                        Text("E-Mail Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
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
                              keyboardType: TextInputType.emailAddress,


                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon( Icons.email,color: Color(0xff1f95a1),),
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey  ),
                                ),
                                hintText: "Enter Your Email",

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
                        Text("Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
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
                              obscureText: notvisible ,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    notvisible = !notvisible;
                                  });
                                },icon:  notvisible ? Icon(Icons.visibility,color: Color(0xff1f95a1),) : Icon(Icons.visibility_off,color: Color(0xff1f95a1),),

                                ),
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon( Icons.lock,color: Color(0xff1f95a1),),
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
                                hintText: "Enter Your Password",

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
                        Text("Confirm Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
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
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: notvisible2,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    notvisible2 = !notvisible2;
                                  });
                                },icon:  notvisible2 ? Icon(Icons.visibility,color: Color(0xff1f95a1),) : Icon(Icons.visibility_off,color: Color(0xff1f95a1),),

                                ),
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon( Icons.lock,color: Color(0xff1f95a1),),
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
                                hintText: "Confirm Your Password",

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                )),
              ),
              SizedBox(height: 50,),
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
                          pageBuilder: (context, animation1, animation2) => SignUp2(),
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
                          pageBuilder: (context, animation1, animation2) => SignUp4(),
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
