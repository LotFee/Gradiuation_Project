import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class FlatMap extends StatefulWidget {
  const FlatMap({Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  final String latitude;
  final String longitude;
  @override
  _FlatMapState createState() => _FlatMapState();
}

class _FlatMapState extends State<FlatMap> {
  GoogleMapController? googlemap;
  var marker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flat Location'),
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
                    position: LatLng(double.parse(widget.latitude), double.parse(widget.longitude))));
              });
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(double.parse(widget.latitude), double.parse(widget.longitude)), zoom: 11.5),
            markers: marker,
          ),

        ],
      ),
    );
  }
}
