import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class OurLocation extends StatefulWidget {

  @override
  _OurLocationState createState() => _OurLocationState();
}

class _OurLocationState extends State<OurLocation> {
  GoogleMapController? googlemap;
  var marker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Location'),
        backgroundColor: Color(0xff1f95a1),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              googlemap = controller;
              setState(() {
                marker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.6206688, 32.2708609)));
              });
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(30.6206688, 32.2708609), zoom: 11.5),
            markers: marker,
          ),

        ],
      ),
    );
  }
}
