import 'package:flutter/material.dart';
import 'user.dart';

class Users with ChangeNotifier {
  List<User> _users = [
    User(password: "", gender: "", email: "", age: "", lName: "", fName: ""),

  ];

  List<User> get users {
    return [..._users];
  }

  void updateUser1( String fName, String lName  )
  {
    _users[0].fName=fName;
    _users[0].lName=lName;

  }
  void updateUser2( String gender, String age  )
  {
    _users[0].gender=gender;
    _users[0].age=age;

  }
  void updateUser3( String gmail, String password  )
  {
    _users[0].email=gmail;
    _users[0].password=password;


  }

}

  // void addUser(User user) {
  //   final newUser = User(
  //     //  id: DateTime.now().toString(),
  //       fName: user.fName,
  //       lName: user.lName,
  //       age: user.age,
  //       email: user.email,
  //       gender: user.gender,
  //       password: user.password);
  //   _users.add(newUser);
  //   notifyListeners();
  // }

  // User findById(String id) {
  //   return _users.firstWhere((prod) => prod.id == id);
  // }

//   void updateUser(String id, User newUser) {
//    // final userIndex = _users.indexWhere((user) => user.id == id);
//     if (userIndex >= 0) {
//       _users[userIndex] = newUser;
//       notifyListeners();
//     } else {
//       print('...');
//     }
//   }
// }
