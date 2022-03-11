import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/users.dart';
import 'package:sakkeny/screens/register/signUp4.dart';
import 'package:sakkeny/screens/register/signUp2.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:http/http.dart';


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
                    // RaisedButton(
                    //
                    //   color: Color(0xff1f95a1), // background
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10)), // foreground
                    //   onPressed: () {
                    //     Navigator.pop(context,PageRouteBuilder(
                    //       pageBuilder: (context, animation1, animation2) => SignUp2(),
                    //       transitionDuration: Duration.zero,
                    //     ),);
                    //   },
                    //   child: Text("Back",style: TextStyle(color: Colors.white ,fontSize: 25),),
                    //   padding: EdgeInsets.only(top: 8,bottom: 8),
                    // ),
                    RaisedButton(

                      color: Color(0xff1f95a1), // background
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)), // foreground
                      onPressed: () {
                        if(validate())
                          {

                            adduser.updateUser3(email.text, password.text);
                            setState(() {
                                fname = adduser.users[0].fName;
                                lname = adduser.users[0].lName;
                                gender = adduser.users[0].gender;
                                age = adduser.users[0].age;

                            });
                            signup(fname, lname, email.text, password.text, gender, age, password.text);

                          }

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
  Future <void> signup(String fname,String lname,String email,String password,String gender, String age,String cpassword) async
  {
    Map data = {
      'FName': fname,
      'LName': lname,
      'Gmail' : email,
      'Gender' : gender,
      'Age' : age,
      'Password': password,
      'CPassword':cpassword,
    };
    print(data.toString());


      Response response = await http.post(
        Uri.parse('https://graduation-api.herokuapp.com/admin/adduser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print('Sign UP success');
        print(_data);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account Created SuccessFully')),
        );
        Navigator.push(context,PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => SignUp4(),
          transitionDuration: Duration.zero,
        ),);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid Data"),
        ));
        print(_data);
      }

  }

}
