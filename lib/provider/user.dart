import 'package:flutter/material.dart';


class User with ChangeNotifier{
   String fName;
  String lName ;
  String gender ;
  String age ;
  String email ;
  String password ;
// final String id;


  User({
   // required this.id,
    required this.fName,
    required this.lName,
    required this.gender,
    required this.age,
    required this.email,
    required this.password,
  }
      );
}
