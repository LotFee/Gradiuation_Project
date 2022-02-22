import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {


  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File ?  file;

  Future pickerCamera(int index)async {
    final myfile = await ImagePicker().pickImage(source: index==0  ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      file =File(myfile!.path);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        elevation: 16,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 100,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: ( ){

                          pickerCamera(0);}, icon: Icon(Icons.camera),iconSize: 50,color: Color(
                            0xff1f95a1),),
                        Text("Camera",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),)
                      ],
                    ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: ( ){pickerCamera(1);}, icon: Icon(Icons.photo),iconSize: 50,color: Color(0xff1f95a1),),
                    Text("Gallery",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),)
                  ],
                ),


              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
