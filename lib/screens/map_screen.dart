import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  final String latitude;
  final String longitude;
  static const String routeName = 'MapScreen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? googlemap;
  var lat = 0.0;
  var long = 0.0;
  var marker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Choose Your Location'),
        backgroundColor: Color(0xff1f95a1),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onLongPress: (LatLng latLng) {
              Marker markerr = marker.firstWhere(
                (marker) => marker.markerId.value == "2",
              );
              setState(() {
                marker.remove(markerr);
              });
            },
            onTap: (LatLng latLng) {
              var lat2 = lat;
              var long2 = long;
              setState(() {
                lat = latLng.latitude;

                long = latLng.longitude;

                print(lat.toString() + '   ' + long.toString());
                marker.add(Marker(
                    markerId: MarkerId('2'), position: LatLng(lat, long)));
                if (lat != lat2 && long != long2) {
                  marker.add(Marker(
                      markerId: MarkerId('2'), position: LatLng(lat, long)));
                }
              });

            },
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton.icon(
                        onPressed: () {
                          String latlng = lat.toString() + ' '+ long.toString();
                            Navigator.pop(context,latlng);
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: Color(0xff1f95a1),
                        ),
                        label: Text('Confirm Your Location')))),
          ),
        ],
      ),
    );
  }
}
