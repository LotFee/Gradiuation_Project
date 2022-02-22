import 'package:flutter/material.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:sakkeny/widget/pickImage.dart';

class AddOne extends StatefulWidget {
  const AddOne({Key? key}) : super(key: key);
  static const String routeName= 'addOne';

  @override
  _AddOneState createState() => _AddOneState();
}

class _AddOneState extends State<AddOne> {

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
        title: Center(child: Text("Add Post", style: TextStyle(color:Color(0xff1f95a1),fontWeight: FontWeight.bold ),)),
        actions: [
          GestureDetector(onTap: (){},child: Icon(Icons.search,color: Color(0xff1f95a1),size: 35)),
        ],
      ),
      drawer: myDrawer(),

      bottomNavigationBar: myBottomBar(index: 4,),
    );
  }
}
