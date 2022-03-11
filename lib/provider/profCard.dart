import 'package:flutter/material.dart';


class ProfCard with ChangeNotifier{
  String fName='hamed';
  String lName='ahmed';
  String gender='0';
  int age=0;
  String email='@gmail';
  String password='***';
  String id ='1';


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
