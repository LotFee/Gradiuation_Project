import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/screens/addPost/addTwo.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:sakkeny/widget/pickImage.dart';

class AddOne extends StatefulWidget {
  const AddOne({Key? key}) : super(key: key);
  static const String routeName = 'addOne';

  @override
  _AddOneState createState() => _AddOneState();
}

class _AddOneState extends State<AddOne> {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                onTap: () {},
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
                  images.isEmpty
                      ? Center(child: Text("Plz Select Images",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))
                      : GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          children: List.generate(images.length, (index) {
                            Asset asset = images[index];
                            return AssetThumb(
                              asset: asset,
                              width: 300,
                              height: 300,

                            );
                          }),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: pickImages,
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


                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: myBottomBar(
          index: 4,
        ),
      ),
    );
  }
}
