import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/user.dart';
import 'package:sakkeny/provider/user_image.dart';
import 'package:sakkeny/provider/users.dart';
import 'package:sakkeny/homeScreens/userProf.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:sakkeny/screens/forget_password/forget1.dart';

class EditProf extends StatefulWidget {
  static const String routeName = 'editProf';

  @override
  State<EditProf> createState() => _EditProfState();
}

class _EditProfState extends State<EditProf> {
  var _isInit = true;
  bool notvisible = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  File? file;

  Future pickerCamera(int index) async {
    final myfile = await ImagePicker().pickImage(
        source: index == 0 ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      file = File(myfile!.path);
    });
  }

  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  //TextEditingController gender = new TextEditingController();
  TextEditingController age = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUserData>(context, listen: false);
    final userImage = Provider.of<CurrentUserImage>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          foregroundColor: Color(0xff1f95a1),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              UserProf(),
                          transitionDuration: Duration.zero,
                        ),
                      );
                    },
                    color: Color(0xff1f95a1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        NetworkImage(currentUser.currentUserDate.img),
                    foregroundImage: file == null ? null : FileImage(file!),
                  ),
                  Positioned(
                    top: 90,
                    left: 95,
                    child: Container(
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
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo),
                            color: Color(0xff1f95a1),
                            onPressed: () {
                              if (true) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) => Container(
                                          child: Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            elevation: 16,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Container(
                                                width: 100,
                                                height: 150,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            pickerCamera(0);
                                                          },
                                                          icon: Icon(
                                                              Icons.camera),
                                                          iconSize: 50,
                                                          color:
                                                              Color(0xff1f95a1),
                                                        ),
                                                        Text(
                                                          "Camera",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            pickerCamera(1);
                                                          },
                                                          icon:
                                                              Icon(Icons.photo),
                                                          iconSize: 50,
                                                          color:
                                                              Color(0xff1f95a1),
                                                        ),
                                                        Text(
                                                          "Gallery",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ));
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xfff1f1f1),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Color(0xff1f95a1),
                            ),
                            title: TextFormField(
                              // initialValue: currentUser.currentUserDate.fName,
                              textInputAction: TextInputAction.next,
                              controller: fname,
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
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintText: "first name",
                              ),
                              validator: (val) {
                                if (val!.length == 0)
                                  return "Please enter first name";
                                else if (val.contains(RegExp(r'[0-9]')))
                                  return "name only character";
                                else
                                  return null;
                              },
                              // onSaved: (value) {
                              //   _editProfCard = ProfCard(
                              //     id: _editProfCard.id,
                              //     fName: _editProfCard.fName,
                              //     lName: _editProfCard.lName,
                              //     gender: _editProfCard.gender,
                              //     age: _editProfCard.age,
                              //     email: _editProfCard.email,
                              //     password: _editProfCard.password,
                              //
                              //
                              //   );
                              // },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Color(0xff1f95a1),
                            ),
                            title: TextFormField(
                              controller: lname,
                              // initialValue: currentUser.currentUserDate.lName,
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
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintText: "last name",
                              ),
                              validator: (val) {
                                if (val!.length == 0)
                                  return "Please enter last name";
                                else if (val.contains(RegExp(r'[0-9]')))
                                  return "name only character";
                                else
                                  return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.wc_sharp,
                              color: Color(0xff1f95a1),
                            ),
                            title: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                suffixIcon: PopupMenuButton(
                                  onSelected: (v) {
                                    setState(() {
                                      currentUser.currentUserDate.gender =
                                          v.toString();
                                      print(currentUser.currentUserDate.gender);
                                    });
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text('Male'),
                                      value: 'Male',
                                    ),
                                    PopupMenuItem(
                                      child: Text('Female'),
                                      value: 'Female',
                                    ),
                                  ],
                                  icon: Icon(Icons.keyboard_arrow_down),
                                ),
                                enabledBorder: InputBorder.none,
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintText: currentUser.currentUserDate.gender,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.calendar_today,
                              color: Color(0xff1f95a1),
                            ),
                            title: TextFormField(
                              controller: age,
                              // initialValue: currentUser.currentUserDate.age,
                              keyboardType: TextInputType.number,
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
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintText: "Age",
                              ),
                              validator: (val) {
                                if (val!.length == 0)
                                  return "Please enter your age";
                                else
                                  return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.lock,
                              color: Color(0xff1f95a1),
                            ),
                            title: TextFormField(
                              initialValue: "******",
                              readOnly: true,
                              textInputAction: TextInputAction.done,
                              obscureText: notvisible,
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
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgetOne()),
                                          (route) => false);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color(0xff1f95a1),
                                    )),
                                enabledBorder: InputBorder.none,
                                //  labelText: "Enter Your  First Name",
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff1f95a1),
                      child: MaterialButton(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          if (validate()) {
                            userImage.currentUserImage.image=file;
                            final currentUserImagee =
                                Provider.of<CurrentUserImage>(context,
                                    listen: false);
                            editProfile(
                                fname: fname.text,
                                lname: lname.text,
                                email: currentUser.currentUserDate.email,
                                gender: currentUser.currentUserDate.gender,
                                age: age.text,
                                password: currentUser.currentUserDate.password,
                                cpassword: currentUser.currentUserDate.password,
                                userImag:
                                    currentUserImagee.currentUserImage.image);
                            // updateUser(fname.text, lname.text,currentUser.currentUserDate.gender , age.text);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editProfile({
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
      final currentUser = Provider.of<CurrentUserData>(context, listen: false);
      var uri = Uri.parse(
          'https://graduation-api.herokuapp.com/updateUser/${currentUser.currentUserDate.id}');
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
      if (userImag != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'file', userImag.path,
            contentType: MediaType('image', 'jpg')));
      }

      var response = await request.send();
      var jsonData = jsonDecode(await response.stream.bytesToString());
      print("${response.statusCode}");
      if (response.statusCode == 200) {
        print('Uploaded!');
        print(jsonData);
        final currentUser =
            Provider.of<CurrentUserData>(context, listen: false);
        currentUser.currentuserdata(CurrentUser(
            fName: jsonData['user']['Fname'],
            lName: jsonData['user']['Lname'],
            gender: jsonData['user']['gender'],
            age: jsonData['user']['age'],
            email: jsonData['user']['gmail'],
            password: jsonData['user']['password'],
            img: jsonData['user']['url'],
            id: jsonData['user']['_id']));

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => UserProf()),
            (route) => false);
        print(json);
      } else {
        print("${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateUser(fname, lname, gender, age) async {
    final currentUser = Provider.of<CurrentUserData>(context, listen: false);
    Map data = {
      "FName": fname,
      "LName": lname,
      "Gmail": currentUser.currentUserDate.email,
      "Gender": gender,
      "Age": age,
      "Password": currentUser.currentUserDate.password,
    };
    print(data.toString());
    Response response = await http.post(
      Uri.parse(
          'https://graduation-api.herokuapp.com/admin/updateUser/${currentUser.currentUserDate.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    var _data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(_data['message']);
      Map<String, dynamic> user = _data['user'];
      currentUser.currentuserdata(CurrentUser(
          fName: user['Fname'],
          lName: user['Lname'],
          gender: user['gender'],
          img: user['url'],
          age: user['age'],
          email: user['gmail'],
          password: user['password'],
          id: user['_id']));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User Updated")));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => UserProf()),
          (route) => false);
    } else {
      print(_data['message']);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Wrong !"),
      ));
    }
  }
}
//
//   @override
//   noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }
