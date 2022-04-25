import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:sakkeny/screens/addPost/addTwo.dart';
import 'package:sakkeny/screens/search/search%20and%20filter.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:sakkeny/widget/pickImage.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'dart:async';
import 'dart:io';


import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class AddOne extends StatefulWidget {
  const AddOne({Key? key}) : super(key: key);
  static const String routeName = 'addOne';

  @override
  _AddOneState createState() => _AddOneState();
}

class _AddOneState extends State<AddOne> {
  List<File> _files=[];
  TextEditingController price = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController noBed = new TextEditingController();
  TextEditingController nonoBedroom = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController description = new TextEditingController();
  bool  wifi=false;
  bool tv=false;
  bool cond = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  List<Asset> images = <Asset>[];
  Future<void> pickImages() async {

    List<Asset> resultList = <Asset>[];
    try {
    resultList= await  MultiImagePicker.pickImages(
        maxImages: 50,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarColor: '#1f95a1',
          statusBarColor: '#1f95a1',
          selectCircleStrokeColor: '#1f95a1',
          actionBarTitle: "Select Flat Images",
        ),
      );

    } on Exception catch (e) {
      print(e);
    }
    setState(() {
      images = resultList;

    });

  }
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  List<File> imagesFile =[];

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if(pickedfiles != null){
        imagefiles = pickedfiles;
        imagesFile = imagefiles!.map((e) => File(e.path) ).toList();
        setState(() {
        print(imagesFile[0].path);
        });
      }else{
        print("No image is selected.");
      }
    }catch (e) {
      print("error while picking file.");
    }
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
          "Add Post",
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
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload Images",
                  style: TextStyle(
                      color: Color(0xff1f95a1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20,),
                imagefiles != null?Wrap(
                  children: imagefiles!.map((imageone){
                    return Container(
                        child:Card(
                          child: Container(
                            height: 100, width:100,
                            child: Image.file(File(imageone.path)),
                          ),
                        )
                    );
                  }).toList(),
                ):Center(child: Text("Plz Select Images",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: openImages,
                    color: Color(0xff1f95a1),
                    child: ListTile(
                      leading: Icon(
                        Icons.upload_sharp,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Upload Images",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Price",
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

                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: price,
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
                        prefixIcon: Icon( Icons.price_check_rounded,color: Color(0xff1f95a1),),
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
                        hintText: "Enter The price",

                      ),
                      validator: (val) {
                        if (val!.length == 0)
                          return "Please enter the price";
                        else
                          return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "Location",
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

                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: location,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
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
                        prefixIcon: Icon( Icons.location_on,color: Color(0xff1f95a1),),
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
                        hintText: "Enter Your Location",

                      ),
                      validator: (val) {
                        if (val!.length == 0)
                          return "Please enter your location";
                        else
                          return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "Number Of Bedrooms",
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

                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: nonoBedroom,
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
                        prefixIcon: Icon( Icons.bedroom_parent,color: Color(0xff1f95a1),),
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
                        hintText: "Enter the number of bedrooms",

                      ),
                      validator: (val) {
                        if (val!.length == 0)
                          return "Please enter the number of bedrooms";
                        else
                          return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "Number Of Beds",
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

                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: noBed,
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
                        prefixIcon: Icon( Icons.bedroom_parent,color: Color(0xff1f95a1),),
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
                        hintText: "Enter the number of beds",

                      ),
                      validator: (val) {
                        if (val!.length == 0)
                          return "Please enter the number of beds";
                        else
                          return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "Another things",
                  style: TextStyle(
                      color: Color(0xff1f95a1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Checkbox(activeColor: Color(0xFF1F95A1),value: wifi, onChanged:(bool  ? value){setState(() {
                      wifi = value!;
                    });} ),
                    Text(
                      "WiFi",
                      style: TextStyle(
                          color: Color(0xff1f95a1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Checkbox(activeColor: Color(0xFF1F95A1),value: tv, onChanged:(bool  ? value){setState(() {
                      tv = value!;
                    });} ),
                    Text(
                      "Tv",
                      style: TextStyle(
                          color: Color(0xff1f95a1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Checkbox(activeColor: Color(0xFF1F95A1),value: cond, onChanged:(bool  ? value){setState(() {
                      cond = value!;
                    });} ),
                    Text(
                      "Conditioner",
                      style: TextStyle(
                          color: Color(0xff1f95a1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
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

                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: phone,
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
                SizedBox(height: 15,),
                Text(
                  "Description",
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

                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: description,
                      minLines: 6,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
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
                        prefixIcon: Icon( Icons.document_scanner,color: Color(0xff1f95a1),),
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
                        hintText: "Enter data about your rent home",

                      ),
                      validator: (val) {
                        if (val!.length == 0)
                          return "Please enter any description";
                        else
                          return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50,left: 70,right: 70,top: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: (){
                      if(validate() && images.isNotEmpty)
                        {
                          Navigator.push(context,PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => AddTwo(),
                            transitionDuration: Duration.zero,
                          ),);
                        }
                    },
                    color: Color(0xff1f95a1),
                    child: GestureDetector(
                      onTap: (){
                        if(validate()){
                          addPost(price: price.text, location: location.text, nobeds: noBed.text, nobedrooms: nonoBedroom.text, wifi: wifi, tv: tv, cond: cond, desc: description.text,phonenumber: phone.text, imagesList:imagesFile );
                        }
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
      bottomNavigationBar: myBottomBar(
        index: 4,
      ),
    );
  }
  Future<void> addPost({
    required String price,
    required String location,
    required String nobeds,
    required String nobedrooms,
    required bool wifi,
    required bool tv,
    required bool cond,
    required String desc,
    required String phonenumber,
    required List<File> imagesList,
  }) async {
    try {
      final currentuser = Provider.of<CurrentUserData>(context, listen: false);

      var uri = Uri.parse('https://afternoon-ridge-73830.herokuapp.com/createPost/${currentuser.currentUserDate.id}');
      var request = http.MultipartRequest('POST', uri)
        ..fields['price'] = price.toString()
        ..fields['location'] = location
        ..fields['numberofbedrooms'] = nobedrooms.toString()
        ..fields['numberofbeds'] = nobeds.toString()
        ..fields['wifi'] = wifi.toString()
        ..fields['tv'] = tv.toString()
        ..fields['conditioner'] = cond.toString()
        ..fields['description'] = desc
        ..fields['phoneNumber'] = phonenumber.toString() ;
      List<http.MultipartFile> newList = [];

      for (int i = 0; i < imagesList.length; i++) {
        String x = imagesFile[i].path.split('.').last;

          var multipartFile = await http.MultipartFile.fromPath(
            'image',
            imagesList[i].path,
             contentType: MediaType('image', x),
          );
          newList.add(multipartFile);
      }
         request.files.addAll(newList);
      var response = await request.send();
      print(response.toString()) ;
      var jsonData = jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        print('Uploaded!');
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
                        padding: const EdgeInsets.only(top: 20,left: 8,right: 8,bottom: 20),
                        child: Text(
                          "Your post is Done ",
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
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => AddTwo()), (route) => false);
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.all(10.0),
                            child: Text(
                              "Go to fill another information",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));

      } else {
        print("${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
