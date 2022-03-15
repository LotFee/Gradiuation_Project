import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/style.dart';
import 'package:sakkeny/screens/forget_password/forget3.dart';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:sakkeny/screens/forget_password/timer.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetTwo extends StatefulWidget {
  static const String routeName = 'forget_two';

  final String lastEmail ;

  const ForgetTwo({Key? key, required this.lastEmail}) : super(key: key);

  @override
  State<ForgetTwo> createState() => _ForgetTwoState();
}

class _ForgetTwoState extends State<ForgetTwo> {
  String x='';
  final OtpFieldController _codeController=new OtpFieldController();
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
                    //'Forget Password',
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
                    'Enter verification code',
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
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Please, enter the verification codewe sent to your E-mail address',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
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
                  child:OTPTextField(
                    controller: _codeController,
                      length: 6,
                      width: 270,
                      fieldWidth:45 ,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      otpFieldStyle: OtpFieldStyle(
                      borderColor: Color(0xff1f95a1),
                      enabledBorderColor: Color(0xff1f95a1),
                      focusBorderColor: Color(0xff1f95a1),
                        errorBorderColor:Colors.red,

                       ),

                      onCompleted: (pin) {
                        print("Completed: " + pin);
                         x =pin;
                      },

                  ),
                  // child:Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Flexible(
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: <BoxShadow>[
                  //                 BoxShadow(
                  //                   color: Colors.black26,
                  //                   blurRadius: 20.0,
                  //                   offset: Offset(0.0, 7),
                  //                   //  spreadRadius: 50.0,
                  //                 )
                  //               ],
                  //             ),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               child: Container(
                  //                 color: Colors.white,
                  //                 child: TextFormField(
                  //                   keyboardType: TextInputType.number,
                  //                   textInputAction: TextInputAction.next,
                  //                   inputFormatters: [
                  //                     LengthLimitingTextInputFormatter(1),
                  //                   ],
                  //                   showCursor: false,
                  //                   textAlign: TextAlign.center,
                  //                   decoration: InputDecoration(
                  //                     errorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     focusedErrorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     enabledBorder: InputBorder.none,
                  //                     focusedBorder: OutlineInputBorder(
                  //                       borderSide:
                  //                           BorderSide(color: Colors.white),
                  //                     ),
                  //                     hintText: "X",
                  //                     hintStyle: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   validator: (val){
                  //                     if (val!.length == 0)
                  //                       return "n";
                  //                     else if (!val.contains("0") &&!val.contains("1")&& !val.contains("2") &&!val.contains("3")&&!val.contains("4") &&!val.contains("5")&& !val.contains("6") &&!val.contains("7")&&!val.contains("8") &&!val.contains("9"))
                  //                       return "n";
                  //                     else
                  //                       return null;
                  //                   },
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Flexible(
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: <BoxShadow>[
                  //                 BoxShadow(
                  //                   color: Colors.black26,
                  //                   blurRadius: 20.0,
                  //                   offset: Offset(0.0, 7),
                  //                   //  spreadRadius: 50.0,
                  //                 )
                  //               ],
                  //             ),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               child: Container(
                  //                 color: Colors.white,
                  //                 child: TextFormField(
                  //                   keyboardType: TextInputType.number,
                  //                   textInputAction: TextInputAction.next,
                  //                   inputFormatters: [
                  //                     LengthLimitingTextInputFormatter(1),
                  //                   ],
                  //                   showCursor: false,
                  //                   textAlign: TextAlign.center,
                  //                   decoration: InputDecoration(
                  //                     errorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     focusedErrorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     enabledBorder: InputBorder.none,
                  //                     focusedBorder: OutlineInputBorder(
                  //                       borderSide:
                  //                           BorderSide(color: Colors.white),
                  //                     ),
                  //                     hintText: "X",
                  //                     hintStyle: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   validator: (val){
                  //                     if (val!.length == 0)
                  //                       return "n";
                  //                     else if (!val.contains("0") &&!val.contains("1")&& !val.contains("2") &&!val.contains("3")&&!val.contains("4") &&!val.contains("5")&& !val.contains("6") &&!val.contains("7")&&!val.contains("8") &&!val.contains("9"))
                  //                       return "n";
                  //                     else
                  //                       return null;
                  //                   },
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Flexible(
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: <BoxShadow>[
                  //                 BoxShadow(
                  //                   color: Colors.black26,
                  //                   blurRadius: 20.0,
                  //                   offset: Offset(0.0, 7),
                  //                   //  spreadRadius: 50.0,
                  //                 )
                  //               ],
                  //             ),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               child: Container(
                  //                 color: Colors.white,
                  //                 child: TextFormField(
                  //                   keyboardType: TextInputType.number,
                  //                   textInputAction: TextInputAction.next,
                  //                   inputFormatters: [
                  //                     LengthLimitingTextInputFormatter(1),
                  //                   ],
                  //                   showCursor: false,
                  //                   textAlign: TextAlign.center,
                  //                   decoration: InputDecoration(
                  //                     errorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     focusedErrorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     enabledBorder: InputBorder.none,
                  //                     focusedBorder: OutlineInputBorder(
                  //                       borderSide:
                  //                           BorderSide(color: Colors.white),
                  //                     ),
                  //                     hintText: "X",
                  //                     hintStyle: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   validator: (val){
                  //                     if (val!.length == 0)
                  //                       return "n";
                  //                     else if (!val.contains("0") &&!val.contains("1")&& !val.contains("2") &&!val.contains("3")&&!val.contains("4") &&!val.contains("5")&& !val.contains("6") &&!val.contains("7")&&!val.contains("8") &&!val.contains("9"))
                  //                       return "n";
                  //                     else
                  //                       return null;
                  //                   },
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Flexible(
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: <BoxShadow>[
                  //                 BoxShadow(
                  //                   color: Colors.black26,
                  //                   blurRadius: 20.0,
                  //                   offset: Offset(0.0, 7),
                  //                   //  spreadRadius: 50.0,
                  //                 )
                  //               ],
                  //             ),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               child: Container(
                  //                 color: Colors.white,
                  //                 child: TextFormField(
                  //                   keyboardType: TextInputType.number,
                  //                   textInputAction: TextInputAction.next,
                  //                   inputFormatters: [
                  //                     LengthLimitingTextInputFormatter(1),
                  //                   ],
                  //                   showCursor: false,
                  //                   textAlign: TextAlign.center,
                  //                   decoration: InputDecoration(
                  //                     errorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     focusedErrorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     enabledBorder: InputBorder.none,
                  //                     focusedBorder: OutlineInputBorder(
                  //                       borderSide:
                  //                           BorderSide(color: Colors.white),
                  //                     ),
                  //                     hintText: "X",
                  //                     hintStyle: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   validator: (val){
                  //                     if (val!.length == 0)
                  //                       return "n";
                  //                     else if (!val.contains("0") &&!val.contains("1")&& !val.contains("2") &&!val.contains("3")&&!val.contains("4") &&!val.contains("5")&& !val.contains("6") &&!val.contains("7")&&!val.contains("8") &&!val.contains("9"))
                  //                       return "n";
                  //                     else
                  //                       return null;
                  //                   },
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Flexible(
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: <BoxShadow>[
                  //                 BoxShadow(
                  //                   color: Colors.black26,
                  //                   blurRadius: 20.0,
                  //                   offset: Offset(0.0, 7),
                  //                   //  spreadRadius: 50.0,
                  //                 )
                  //               ],
                  //             ),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               child: Container(
                  //                 color: Colors.white,
                  //                 child: TextFormField(
                  //                   keyboardType: TextInputType.number,
                  //                   textInputAction: TextInputAction.next,
                  //                   inputFormatters: [
                  //                     LengthLimitingTextInputFormatter(1),
                  //                   ],
                  //                   showCursor: false,
                  //                   textAlign: TextAlign.center,
                  //                   decoration: InputDecoration(
                  //                     errorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     focusedErrorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     enabledBorder: InputBorder.none,
                  //                     focusedBorder: OutlineInputBorder(
                  //                       borderSide:
                  //                           BorderSide(color: Colors.white),
                  //                     ),
                  //                     hintText: "X",
                  //                     hintStyle: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   validator: (val){
                  //                     if (val!.length == 0)
                  //                       return "n";
                  //                     else if (!val.contains("0") &&!val.contains("1")&& !val.contains("2") &&!val.contains("3")&&!val.contains("4") &&!val.contains("5")&& !val.contains("6") &&!val.contains("7")&&!val.contains("8") &&!val.contains("9"))
                  //                       return "n";
                  //                     else
                  //                       return null;
                  //                   },
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Flexible(
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: <BoxShadow>[
                  //                 BoxShadow(
                  //                   color: Colors.black26,
                  //                   blurRadius: 20.0,
                  //                   offset: Offset(0.0, 7),
                  //                   //  spreadRadius: 50.0,
                  //                 )
                  //               ],
                  //             ),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               child: Container(
                  //                 color: Colors.white,
                  //                 child: TextFormField(
                  //                   keyboardType: TextInputType.number,
                  //                   textInputAction: TextInputAction.next,
                  //                   inputFormatters: [
                  //                     LengthLimitingTextInputFormatter(1),
                  //                   ],
                  //                   showCursor: false,
                  //                   textAlign: TextAlign.center,
                  //                   decoration: InputDecoration(
                  //                     errorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     focusedErrorBorder: new OutlineInputBorder(
                  //                       borderSide: new BorderSide(
                  //                           color: Colors.white, width: 0.0),
                  //                     ),
                  //                     enabledBorder: InputBorder.none,
                  //                     focusedBorder: OutlineInputBorder(
                  //                       borderSide:
                  //                           BorderSide(color: Colors.white),
                  //                     ),
                  //                     hintText: "X",
                  //                     hintStyle: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   validator: (val){
                  //                     if (val!.length == 0)
                  //                       return "n";
                  //                     else if (!val.contains("0") &&!val.contains("1")&& !val.contains("2") &&!val.contains("3")&&!val.contains("4") &&!val.contains("5")&& !val.contains("6") &&!val.contains("7")&&!val.contains("8") &&!val.contains("9"))
                  //                       return "n";
                  //                     else
                  //                       return null;
                  //                   },
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ),
              ),
              TimerComponent(lastEmail: widget.lastEmail,),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff1f95a1),
                  child: MaterialButton(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      print(x);
                        getPassword(x);
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
  Future<void> getPassword(code) async {
    Map data = {
      'codeNumber': code,
    };
    print(data.toString());
      Response response = await http.post(
        Uri.parse('https://graduation-api.herokuapp.com/admin/postReset'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(_data['message']);
        print('code send to this gmail');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Code send")));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ForgetThree(code: code,)), (route) => false);
      } else {
        print(_data['message']);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Wrong Email"),
        ));
      }

  }
}
