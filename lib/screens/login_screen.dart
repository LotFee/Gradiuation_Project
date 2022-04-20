import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:sakkeny/screens/forget_password/forget1.dart';
import 'package:sakkeny/screens/register/signup1.dart';
import 'package:sakkeny/screens/forget_password/forget1.dart';
import 'package:sakkeny/homeScreens/Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxValue = false;
  bool notvisible = true;
  bool notvisible2 = true;
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool isLoading = false;
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
                  key: formKey,
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
                                textInputAction: TextInputAction.next,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val!.length == 0)
                                    return "Please enter email";
                                  else if (!val.contains("@"))
                                    return "Please enter valid email";
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  focusedErrorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
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
                            "Password",
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
                                controller: _passwordController,
                                obscureText: notvisible,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  focusedErrorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        notvisible = !notvisible;
                                      });
                                    },
                                    icon: notvisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: Color(0xff1f95a1),
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Color(0xff1f95a1),
                                          ),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xff1f95a1),
                                  ),
                                  //  labelText: "Enter Your  First Name",
                                  labelStyle:
                                      TextStyle(color: Color(0xff1f95a1)),
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: "Enter Your Password",
                                ),
                                validator: (val) {
                                  if (val!.length == 0)
                                    return "Please enter password";
                                  else
                                    return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                onPressed: () {
                  Navigator.pushNamed(context, ForgetOne.routeName);
                },
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
                    onPressed: () {
                      if (validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => SpinKitHourGlass(
                              color: Color(0xFF1F95A1),
                            ));

                        login(_emailController.text, _passwordController.text);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUp1.routeName);
                      },
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

  Future<void> login(email, password) async {
    final currentuser = Provider.of<CurrentUserData>(context, listen: false);

    Map data = {
      'Gmail': email,
      'password': password,
    };
    print(data.toString());
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Response response = await http.post(
        Uri.parse('https://graduation-api.herokuapp.com/admin/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);

      Map<String, dynamic> user = _data['user'];
      currentuser.currentuserdata(CurrentUser(
          fName: user['Fname'],
          lName: user['Lname'],
          gender: user['gender'],
          age: user['age'],
          email: user['gmail'],
          password: user['password'],
          img: user['url'],
          id: user['_id']));
      print(user['gmail']);
      print(_data);

      if (response.statusCode == 200) {
        print('Sign in success');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Sign in success")));
        // saveLoginPref(token: _data['token'],email: user['email'],fullname: user['fullname']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
        //  print(user['fullname']);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Wrong Email or Password"),
        ));

      }
    }
  }
}
