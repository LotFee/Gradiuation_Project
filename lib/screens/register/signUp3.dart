import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:sakkeny/provider/user_image.dart';
import 'package:sakkeny/provider/users.dart';
import 'package:sakkeny/screens/register/signUp4.dart';
import 'package:sakkeny/screens/register/signUp2.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';

import 'package:async/async.dart';


class SignUp3 extends StatefulWidget {

  // SignUp3({required  this.fNameController,required this.lNameController,required this.genderController,required this.ageController});
  // final TextEditingController fNameController;
  // final TextEditingController lNameController;
  // final TextEditingController genderController;
  // final TextEditingController ageController;

  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  bool notvisible = true;
  bool notvisible2 = true;
  var register = false;
  String? pass1;
  String? pass2;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  String fname= "";
  String lname= "";
  String age= "";
  String gender= "";
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final adduser = Provider.of<Users>(context);

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
                child: Form(
                    key: formKey,
                    child: Column(
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
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,

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
                                  controller: password,

                                  textInputAction: TextInputAction.next,
                                  obscureText: notvisible ,
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
                                  validator: (val) {
                                    pass1=val;
                                    if (val!.length == 0)
                                      return "Please enter password";
                                    else if (val.length <5 )
                                      return "password must be at least 6 ";
                                    else
                                      return null;
                                  },
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
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
                                    focusedErrorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
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
                                  validator: (val) {
                                    pass2=val;
                                    if (val!.length == 0)
                                      return "Please confirm your password";
                                    else if(pass1 != pass2)
                                      return "password not the same";
                                    else
                                      return null;
                                  },
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
                        Navigator.pop(context,PageRouteBuilder(
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
                      onPressed: () async{

                        if(true)
                        {
                          setState(() {
                            register =true;
                            print("register is true");
                          });


                          adduser.updateUser3(email.text, password.text);
                          setState(() {
                            fname = adduser.users[0].fName;
                            lname = adduser.users[0].lName;
                            gender = adduser.users[0].gender;
                            age = adduser.users[0].age;

                          });
                         // signup(fname, lname, email.text, password.text, gender, age, password.text);
                          final currentUserImagee = Provider.of<CurrentUserImage>(context,listen: false);
                          signup(fname: fname, lname: lname, email: email.text, gender: gender, age: age, password: password.text, cpassword: password.text, userImag: currentUserImagee.currentUserImage.image);
                        //  signup4(fname, lname, email.text, password.text, gender, age, password.text, currentUserImagee.currentUserImage.image! );
                          await Future.delayed(Duration(seconds: 3), () {});
                            setState(() {
                              register= false;
                              print("register is false ");
                            });

                        }

                      },
                      child: register==true ? CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 5,
                      )  : Text("Sign Up",style: TextStyle(color: Colors.white ,fontSize: 25),),
                      padding: EdgeInsets.only(top: 8,bottom: 8,left: 8,right: 8),
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
  Future<void> signup({
    required String fname,
    required String lname,
    required String email,
    required String gender,
    required String age,
    required String password,
    required String cpassword,
    required File? userImag,
  }) async {
    try {

      var uri = Uri.parse('https://graduation-api.herokuapp.com/signUp');
      var extension = userImag?.path.split('.').last;
      print(extension);
      var request = http.MultipartRequest('POST', uri)
        ..fields['FName'] = fname
        ..fields['LName'] = lname
        ..fields['Gmail'] = email
        ..fields['Gender'] = gender
        ..fields['Age'] = age
        ..fields['Password'] = password
        ..fields['CPassword'] = cpassword;
      if(userImag!= null ){
        request.files.add(await http.MultipartFile.fromPath('file', userImag.path,
            contentType: MediaType('image', 'jpg')));
      }


      var response = await request.send();
      var jsonData = jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        print('Uploaded!');
        print(jsonData);
        final currentUser = Provider.of<CurrentUserData>(context,listen: false);
            currentUser.currentuserdata(CurrentUser(
                fName: jsonData['user']['Fname'],
                lName: jsonData['user']['Lname'],
                gender: jsonData['user']['gender'],
                age: jsonData['user']['age'],
                email: jsonData['user']['gmail'],
                password: jsonData['user']['password'],
                img:jsonData['user']['url'] ,
                id: jsonData['user']['_id']));

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SignUp4()), (route) => false);
        print(json);
      } else {
        print("${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }


}