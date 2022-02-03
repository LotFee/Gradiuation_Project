import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/screens/login_screen.dart';
class ForgetThree extends StatefulWidget {
  static const String routeName='forget_three';

  @override
  State<ForgetThree> createState() => _ForgetThreeState();
}

class _ForgetThreeState extends State<ForgetThree> {
  bool notvisible = true;
  bool notvisible2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xff1f95a1),
        ),
        systemOverlayStyle:
        SystemUiOverlayStyle(statusBarColor: Color(0xff1f95a1)),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1f95a1),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'change your password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1f95a1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(children: [
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
                            textInputAction: TextInputAction.next,
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
                ],),
              ),

              SizedBox(height: 60,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff1f95a1),
                  child: MaterialButton(
                    child: Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 16,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child:Container(
                                width: 600,
                                height: 450,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0, right: 40 ,bottom: 20,top: 20),
                                      child: Image.asset(
                                        "images/changepass.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      "Your password",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                        "has been successfully changed",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: RaisedButton(
                                        color: Color(0xff1f95a1), // background
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10)), // foreground
                                        onPressed: () {
                                          Navigator.pushNamed(context, LoginScreen.routeName);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
