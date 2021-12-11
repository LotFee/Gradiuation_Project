import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        // automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                child: Image.asset('images/logo_login.png'),
                radius: 70.0,
              ),
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F95A1),
                  ),
                ),
              ),
              // Form(
              //   child: Padding(
              //     padding: EdgeInsets.all(30),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'E-mail address',
              //               style: TextStyle(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black87,
              //               ),
              //             ),
              //             TextField(
              //               decoration: InputDecoration(
              //                 prefixIcon: Icon(Icons.email),
              //                 // labelText: 'E-mail address',
              //                 hintText: 'Enter your Email',
              //                 hintStyle: TextStyle(
              //                   fontSize: 15,
              //                   color: Colors.grey,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'E-mail address',
              //               style: TextStyle(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black87,
              //               ),
              //             ),
              //             TextField(
              //               decoration: InputDecoration(
              //                 prefixIcon: Icon(Icons.lock),
              //                 // labelText: 'E-mail address',
              //                 hintText: 'Enter your Email',
              //                 hintStyle: TextStyle(
              //                   fontSize: 15,
              //                   color: Colors.grey,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'password',
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
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xff1f95a1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintText: "Enter your password",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xFF1F95A1),
                      value: checkBoxValue,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            checkBoxValue = value!;
                          },
                        );
                      },
                    ),
                    // title: Text('Remember me'),
                    Text('Remember me')
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forget your password?',
                  style: TextStyle(
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                  ),
                ),
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
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'SignUP.',
                        style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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
