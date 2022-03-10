import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakkeny/homeScreens/Home.dart';

class DataAboutYou extends StatefulWidget {
  static const routeName = "dataAboutYou";

  @override
  _DataAboutYouState createState() => _DataAboutYouState();
}

class _DataAboutYouState extends State<DataAboutYou> {
  File? frontid;

  File? backid;

  Future pickerCamerafront(int index) async {
    final myfile = await ImagePicker().pickImage(
        source: index == 0 ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      frontid = File(myfile!.path);
    });
  }

  Future pickerCameraback(int index) async {
    final myfile = await ImagePicker().pickImage(
        source: index == 0 ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      backid = File(myfile!.path);
    });
  }

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
        backgroundColor:  Color(0xff1f95a1),
        title: Text("Data About You",style: TextStyle(color:  Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone Number",
                  style: TextStyle(
                      color: Color(0xff1f95a1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5,),
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

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
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
                          prefixIcon: Icon( Icons.phone,color: Color(0xff1f95a1),),
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
                          hintText: "Enter your phone number",

                        ),
                        validator: (val) {
                          if (val!.length == 0)
                            return "Please enter your phone number";
                          else
                            return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "Upload Your Front ID card",
                  style: TextStyle(
                      color: Color(0xff1f95a1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                frontid == null
                    ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                      child: Text(
                        "Plz Select Images",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )),
                )
                    : Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.file(
                      frontid!,
                      fit: BoxFit.cover
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      if (true) {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => Container(
                              child: Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 16,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    width: 100,
                                    height: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                pickerCamerafront(0);
                                              },
                                              icon: Icon(Icons.camera),
                                              iconSize: 50,
                                              color: Color(0xff1f95a1),
                                            ),
                                            Text(
                                              "Camera",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                pickerCamerafront(1);
                                              },
                                              icon: Icon(Icons.photo),
                                              iconSize: 50,
                                              color: Color(0xff1f95a1),
                                            ),
                                            Text(
                                              "Gallery",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
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
                    color: Color(0xff1f95a1),
                    child: ListTile(
                      leading: Icon(
                        Icons.upload_sharp,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Upload Image",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Upload Your Back ID card",
                  style: TextStyle(
                      color: Color(0xff1f95a1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                backid == null
                    ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                      child: Text(
                        "Plz Select Images",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )),
                )
                    : Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.file(
                    backid!,

                    fit:BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      if (true) {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => Container(
                              child: Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 16,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    width: 100,
                                    height: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                pickerCameraback(0);
                                              },
                                              icon: Icon(Icons.camera),
                                              iconSize: 50,
                                              color: Color(0xff1f95a1),
                                            ),
                                            Text(
                                              "Camera",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                pickerCameraback(1);
                                              },
                                              icon: Icon(Icons.photo),
                                              iconSize: 50,
                                              color: Color(0xff1f95a1),
                                            ),
                                            Text(
                                              "Gallery",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
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
                    color: Color(0xff1f95a1),
                    child: ListTile(
                      leading: Icon(
                        Icons.upload_sharp,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Upload Image",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  BottomAppBar(
        child: Container(
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0,bottom: 20,right: 60,left: 60),
              child: RaisedButton(

                color: Color(0xff1f95a1), // background
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)), // foreground
                onPressed: () {
                      if(validate() && frontid!=null && backid!=null)
                        {
                          showDialog(
                              context: context,
                              barrierDismissible: false ,
                              builder: (context) => Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 16,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    width: 600,
                                    height: 350,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 50,left: 50,right: 50,bottom: 20),
                                          child: Image.asset(
                                            "images/wait.png",
                                            fit: BoxFit.cover,


                                          ),
                                        ),
                                        Text(
                                          "Wait approve from owner ",
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Material(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: Color(0xff1f95a1),
                                            child: MaterialButton(
                                              child: Text(
                                                'Home',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pushNamed(context, Home.routeName);
                                              },
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0,bottom: 5, left: 15,right: 15),
                  child: Text("Book",style: TextStyle(color: Colors.white ,fontSize: 25),),
                ),
                padding: EdgeInsets.only(top: 8,bottom: 8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
