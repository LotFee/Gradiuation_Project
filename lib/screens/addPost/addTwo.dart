import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakkeny/homeScreens/Home.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'package:sakkeny/screens/search/search and filter.dart';

class AddTwo extends StatefulWidget {
  const AddTwo({Key? key}) : super(key: key);

  @override
  _AddTwoState createState() => _AddTwoState();
}

class _AddTwoState extends State<AddTwo> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xff1f95a1),
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0xff1f95a1),
                size: 37, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Center(
            child: Text(
          "Data About Owner",
          style:
              TextStyle(color: Color(0xff1f95a1), fontWeight: FontWeight.bold),
        )),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => SearchFilter(),
                  transitionDuration: Duration.zero,
                ),);
              },
              child: Icon(Icons.search, color: Color(0xff1f95a1), size: 35)),
        ],
      ),
      drawer: myDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 25.0, left: 20, right: 20, bottom: 15),
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.only(bottom: 50,left: 70,right: 70,top: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: (){
                    if(frontid!=null && backid!=null)
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
                                      padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20,
                                          bottom: 20,
                                          top: 20),
                                      child: Image.asset(
                                        "images/post.png",
                                        fit: BoxFit.cover,

                                      ),
                                    ),
                                    Text(
                                      "Your post will be reviewed ",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "befor publication, you will be",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 15.0),
                                      child: Text(
                                        "notified when it is approve",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 15.0),
                                      child: RaisedButton(
                                        color:
                                        Color(0xff1f95a1), // background
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10)), // foreground
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              Home.routeName);
                                        },
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Text(
                                            "Home",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }
                  },
                  color: Color(0xff1f95a1),
                  child: ListTile(
                    leading: Icon(
                      Icons.cloud_upload,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Post",
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
      bottomNavigationBar: myBottomBar(
        index: 4,
      ),
    );
  }
}
