import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/screens/forget_password/forget2.dart';

class ForgetOne extends StatelessWidget {
  static const String routeName = 'forger_one';
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
                    'Enter your E-mail address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1f95a1),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Center(
                      child: Text(
                        'We will send you a verification code to your E-mail address',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-mail address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 2),
                      ),
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
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xff1f95a1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: "Enter your Email",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff1f95a1),
                  child: MaterialButton(
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ForgetTwo.routeName);
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
