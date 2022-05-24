

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:sakkeny/helper/shared_cache.dart';
import 'package:sakkeny/screens/constant.dart';

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
   getUserData(context) async{
    final userId = SharedCache.instance.getData(kUserID) as String;
    print('-----------------------');

    print(userId);
    print('-----------------------');

    final url = "https://afternoon-ridge-73830.herokuapp.com/admin/getUser/$userId";
    final response =   await http.get(Uri.parse(url));
    final extractData = jsonDecode(response.body)['users'];
    print(extractData);
    if(response.statusCode==200){
      print(extractData);
      final currentuser = Provider.of<CurrentUserData>(context, listen: false);
      currentuser.currentuserdata(CurrentUser(
          fName: extractData['Fname'],
          lName: extractData['Lname'],
          gender: extractData['gender'],
          age: extractData['age'],
          email: extractData['gmail'],
          password: extractData['password'],
          img: extractData['url'],
          id: extractData['_id']));

    }

  }
}
