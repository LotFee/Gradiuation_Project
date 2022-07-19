import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:sakkeny/screens/search/locationResult.dart';

import '../helper/location_helper.dart';

class SearchWithLocation extends StatefulWidget {
  const SearchWithLocation(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  final String latitude;
  final String longitude;

  static const String routeName = 'searchWithLocation';
  @override
  _SearchWithLocationState createState() => _SearchWithLocationState();
}

class _SearchWithLocationState extends State<SearchWithLocation> {
  GoogleMapController? googlemap;

  var lat = 0.0;
  var long = 0.0;
  var marker = HashSet<Marker>();
  var marker2 = HashSet<Marker>();
  bool isLoading = false;
  bool noResult= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: isLoading==false? Text('Choose Your Location'): noResult==true? Text('The Result'):Text('The Result'),
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
                marker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(double.parse(widget.latitude),
                        double.parse(widget.longitude))));
                lat = double.parse(widget.latitude);
                long = double.parse(widget.longitude);
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

                Marker markerr = marker.firstWhere(
                  (marker) => marker.markerId.value == "1",
                );
                marker.remove(markerr);

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
                    position: LatLng(double.parse(widget.latitude),
                        double.parse(widget.longitude))));
              });
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(double.parse(widget.latitude),
                    double.parse(widget.longitude)),
                zoom: 13.5),
            markers:isLoading==true? marker2 : marker,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                    alignment: Alignment.bottomRight,
                    child:isLoading==false? RaisedButton.icon(
                        onPressed: () {
                          String finalLatLon = "";
                          if (lat != 0.0 && long != 0.0) {
                            String latlng =
                                lat.toString() + ' ' + long.toString();
                            finalLatLon = latlng;
                            print(latlng);
                          } else {
                            String latlng =
                                widget.latitude + ' ' + widget.longitude;
                            finalLatLon = latlng;

                            print(latlng);
                          }
                          Future<void> getNearstFlats() async {
                            try {
                              var url =
                                  "https://afternoon-ridge-73830.herokuapp.com/posts/nearestPlace/$finalLatLon";
                              final response = await http.get(Uri.parse(url));
                              final extractData = jsonDecode(response.body);
                              print(extractData);
                              if (response.statusCode == 200) {

                                print(extractData['Dpost'].length);
                                var i = extractData['Dpost'].length;
                                print('first location =>'+extractData['Dpost'][0]['locationMap']);
                                var nearstMarker = HashSet<Marker>();
                                for (var j = 0; j < i; j++) {
                                  nearstMarker.add(Marker(
                                      markerId: MarkerId('${j + 1}'),
                                      position: LatLng(
                                          double.parse(extractData['Dpost'][j]
                                                  ['locationMap']
                                              .toString()
                                              .split(" ")
                                              .first),
                                          double.parse(extractData['Dpost'][j]
                                                  ['locationMap']
                                              .toString()
                                              .split(" ")
                                              .last)),
                                  onTap: (){
                                        print('Marker tabed******************************************');
                                        print('the marker flat id is -> '+extractData['Dpost'][j]['_id']);
                                        Future<void> getPostResult ( ) async{
                                          try {
                                              url = "https://afternoon-ridge-73830.herokuapp.com/posts/${extractData['Dpost'][j]['_id']}";
                                            final response =   await http.get(Uri.parse(url));
                                            final flatDetails = jsonDecode(response.body);

                                            if(response.statusCode==200)
                                            {
                                              print(flatDetails);

                                            }
                                          }catch(error){
                                            throw(error.toString());
                                          }
                                        }
                                      //  getPostResult();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  LocationResult(id: extractData['Dpost'][j]['_id'],)),
                                        );






                                  }
                                  )
                                  );
                                  // print(extractData['Dpost'][j]
                                  // ['locationMap']
                                  //     .toString()
                                  //     .split(" ")
                                  //     .first);
                                  // print(extractData['Dpost'][j]
                                  // ['locationMap']
                                  //     );
                                }
                                setState(() {
                                  marker2 = nearstMarker;
                                  isLoading=true;
                                });



                              }
                              else{
                                setState(() {
                                  noResult=true;
                                });
                              }
                            } catch (error) {
                              throw (error.toString());
                            }
                          }

                          getNearstFlats();
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: Color(0xff1f95a1),
                        ),
                        label: Text('Confirm Your Location')) :RaisedButton.icon(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.ads_click,
                          color: Color(0xff1f95a1),
                        ),
                        label: Text('Click to go to the post')) )),
          ),
        ],
      ),
    );
  }
}
