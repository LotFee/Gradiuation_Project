import 'package:flutter/material.dart';


class ProfCard with ChangeNotifier{
  final String fName;
  final String lName;
  final String gender;
  final int age;
  final String email;
  final String password;
  final String id ;


  ProfCard({
    required this.id,
    required this.fName,
    required this.lName,
    required this.gender,
    required this.age,
    required this.email,
    required this.password,
  }
      );
}
