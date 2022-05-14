import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:sakkeny/helper/location_helper.dart';

import '../screens/search/search and filter.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);
  static const String routeName = 'Location';

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImage = '';
  Future<void> _getCurrentUserLocation()async{
    final locationData = await Location().getLocation();
    print(locationData.latitude);
    print(locationData.latitude);
    final staticMapImageUrl =  LocationHelper.generateLocationImage(latitude: locationData.latitude!, longitude: locationData.longitude!);
    setState(() {
      _previewImage =staticMapImageUrl;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xff1f95a1),
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Color(0xff1f95a1) ),

        title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 45),
              child: Text(
                "Location",
                style: TextStyle(
                    color: Color(0xff1f95a1), fontWeight: FontWeight.bold),
              ),
            )),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 170,
            width: double.infinity,
            child: _previewImage =='' ? Text('No Location Choosen',textAlign: TextAlign.center,):  Text('Ur current location is taken ' ,textAlign: TextAlign.center) ,  //Image.network(_previewImage,fit: BoxFit.cover,width: double.infinity,) ,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(onPressed: (){
                _getCurrentUserLocation();
              }, icon :  Icon(Icons.location_on,color: Color(0xff1f95a1),), label: Text('Current Location',style: TextStyle(color: Color(0xff1f95a1),fontWeight: FontWeight.bold),)),
              FlatButton.icon(onPressed: (){}, icon :  Icon(Icons.map,color: Color(0xff1f95a1),), label: Text('Select on Map',style: TextStyle(color: Color(0xff1f95a1),fontWeight: FontWeight.bold))),

            ],
          ),
        ],
      ),
    );
  }
}
