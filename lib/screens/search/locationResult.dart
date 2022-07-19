import 'package:flutter/material.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'package:sakkeny/screens/search/search and filter.dart';
import 'package:sakkeny/widget/flats_grid.dart';

class LocationResult extends StatelessWidget {

final String id ;

  const LocationResult({Key? key,required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,
        title:   Text('The Result') ,
        backgroundColor: Color(0xff1f95a1),
      ),
      body: FlatsGrid(index: 4,idLocation: id,),
    );
  }
}