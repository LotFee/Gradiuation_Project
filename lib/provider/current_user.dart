

import 'package:flutter/material.dart';

class CurrentUser with ChangeNotifier {
  String fName;
  String lName;
  String gender;
  String age;
  String email;
  String password;
  String id;
  String img;

  CurrentUser(
      {required this.fName,
      required this.lName,
      required this.gender,
      required this.age,
      required this.email,
      required this.password,
        required this.img,
      required this.id});
}

class CurrentUserData with ChangeNotifier {
  CurrentUser _currentUser = new CurrentUser(
      fName: "",
      lName: "",
      gender: "",
      age: "",
      email: "",
      password: "",
   img: "",
      id: "");

  CurrentUser get currentUserDate {
    return _currentUser;
  }

  void currentuserdata(CurrentUser c) {
    _currentUser.id = c.id;
    _currentUser.fName = c.fName;
    _currentUser.lName = c.lName;
    _currentUser.gender = c.gender;
    _currentUser.age = c.age;
    _currentUser.email = c.email;
    _currentUser.password = c.password;
    _currentUser.img=c.img;

    notifyListeners();
  }

}
