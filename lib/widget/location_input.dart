import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:sakkeny/helper/location_helper.dart';
import 'package:sakkeny/screens/map_screen.dart';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../screens/search/search and filter.dart';
class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);
  static const String routeName = 'Location';

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImage = '';
  String lon = "";
  String lat = "";
  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
    final staticMapImageUrl = LocationHelper.generateLocationImage(
        latitude: locationData.latitude!, longitude: locationData.longitude!);
    setState(() {
      _previewImage = staticMapImageUrl;
      lon = locationData.longitude!.toString();
      lat = locationData.latitude!.toString();
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
          automaticallyImplyLeading: false,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Color(0xff1f95a1)),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_sharp,
            ),
            onPressed: () {
              String latlng = lat.toString() + ' ' + lon.toString();
              Navigator.pop(context, latlng);
            },
          ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: _previewImage == ''
                  ? Text(
                      'No Location Choosen',
                      textAlign: TextAlign.center,
                    )
                  : Container(
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse(lat), double.parse(lon)), zoom: 11),
                  markers: {
                    Marker(markerId: MarkerId('1'),position: LatLng(double.parse(lat), double.parse(lon)))
                  },
                ),
              ) //Image.network(_previewImage,fit: BoxFit.cover,width: double.infinity,) ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(
                    onPressed: () {
                      _getCurrentUserLocation();
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Color(0xff1f95a1),
                    ),
                    label: Text(
                      'Current Location',
                      style: TextStyle(
                          color: Color(0xff1f95a1), fontWeight: FontWeight.bold),
                    )),
                FlatButton.icon(
                    onPressed: ()  {
                      _getCurrentUserLocation();
                      Timer(Duration(seconds: 2), ()async {
                        String latlng = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MapScreen(latitude: lat, longitude: lon)));
                        setState(() {
                          lat = latlng.split(" ").first;
                          lon = latlng.split(" ").last;
                          print(lat);
                          print(lon);
                        });
                      });
                      // String latlng = await Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             MapScreen(latitude: lat, longitude: lon)));
                      // setState(() {
                      //   lat = latlng.split(" ").first;
                      //   lon = latlng.split(" ").last;
                      //   print(lat);
                      //   print(lon);
                      // });
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>MapScreen(latitude: lat, longitude: lon)));
                    },
                    icon: Icon(
                      Icons.map,
                      color: Color(0xff1f95a1),
                    ),
                    label: Text('Select on Map',
                        style: TextStyle(
                            color: Color(0xff1f95a1),
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
