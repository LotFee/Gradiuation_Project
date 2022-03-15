import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:sakkeny/screens/forget_password/forget2.dart';

class ForgetOne extends StatefulWidget {
  static const String routeName = 'forger_one';

  @override
  State<ForgetOne> createState() => _ForgetOneState();
}

class _ForgetOneState extends State<ForgetOne> {
 final TextEditingController _emailController=new TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter your E-mail address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1f95a1),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
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
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
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
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
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
                            validator: (val) {
                              if (val!.length == 0)
                                return "Please enter email";
                              else if (!val.contains("@"))
                                return "Please enter valid email";
                              else
                                return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
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
                        resetPassword(_emailController.text);
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
  Future<void> resetPassword(email) async {
    Map data = {
      'gmail': email,
    };
    print(data.toString());
    if (_emailController.text.isNotEmpty && validate()) {
      Response response = await http.post(
        Uri.parse('https://graduation-api.herokuapp.com/admin/resetPassword'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);

      // Map<String, dynamic> user = _data['user'];
      //

      print(_data['codeNumber']);
      // print(_data);
      if (response.statusCode == 200) {
        print(_data['message']);
        print('code send to this gmail');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Code send")));
        // saveLoginPref(token: _data['token'],email: user['email'],fullname: user['fullname']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ForgetTwo(lastEmail: _emailController.text,)), (route) => false);
        //  print(user['fullname']);
      } else {
        print(_data['message']);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Wrong Email"),
        ));
      }
    }
  }
}


