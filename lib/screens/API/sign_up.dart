// import 'package:flutter/material.dart';
//
// Future <void> signup(String name,String email,String password,String confirmpassword) async
// {
//   Map data = {
//     'fullname': name,
//     'email': email,
//     'password': password,
//     'passwordConfirm':confirmpassword,
//   };
//   print(data.toString());
//   // final  response= await http.post(
//   //     Uri.parse(AppUrl.signup),
//   //     headers: {
//   //       "Accept": "application/json",
//   //       "Access-Control_Allow_Origin": "*"
//   //     },
//   //
//   //     body: data,
//   //     encoding: Encoding.getByName("utf-8")
//   // )  ;
//   //
//   // if (response.statusCode == 201) {
//   //
//   //   setState(() {
//   //     isLoading=false;
//   //   });
//   //   Map<String,dynamic>resposne=jsonDecode(response.body);
//   //   if(!resposne['error'])
//   //   {
//   //     Map<String,dynamic>user=resposne['data'];
//   //     print(" User name ${user['data']}");
//   //     savePref(1,user['fullname'],user['email'],user['id']);
//   //   }else{
//   //     print(" ${resposne['message']}");
//   //   }
//   //   scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne['message']}")));
//   //
//   // } else {
//   //   scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Try again")));
//   // }
//   if (_emailController.text.isNotEmpty && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _confirmPasswordController.text.isNotEmpty) {
//     Response response = await http.post(
//       Uri.parse(AppUrl.signup),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(data),
//     );
//     var _data = jsonDecode(response.body.toString());
//     if (response.statusCode == 201 && _formKey.currentState.validate()) {
//       print('Sign UP success');
//       print(_data);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Account Created SuccessFully')),
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Sign_In_Screen()),
//       );
//     }
//     else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Invalid Data"),
//       ));
//       print(_data);
//     }
//   }
// }