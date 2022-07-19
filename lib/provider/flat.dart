

import 'package:flutter/material.dart';

class Flat with ChangeNotifier{
  final String id;
  final String ownerId;
  final String userName;
  final String userImage;
  final DateTime time;
  final String location;
  final List<dynamic> images;
  final double price;
  bool isFav;
  final int bedrooms;
  final int bed;
  final int bathroom;
  final String noComments;
   int noLikes;
  final bool wifi;
  final bool tv;
  final bool cond;
  final String description;
  final String locationOnMap;
  final String timeAgo;
  final int phoneNumber;

  Flat(
      {
        required this.timeAgo,
        required this.price,
       required this.id,
        required this.ownerId,
        required this.images,
        required this.wifi,
        required this.description,
        required this.cond,
        required this.location,
        required this.bathroom,
        required this.bed,
        required this.bedrooms,
        required this.isFav,
        required this.time,
        required this.tv,
        required this.userName,
        required this.userImage,
        required this.noComments,
        required this.locationOnMap,
        required this.noLikes,
        required this.phoneNumber
      });

  void toggleFavState(){
    isFav = !isFav;
    notifyListeners();
  }
  void toggleNoLikes(){
    if(isFav==true)
      noLikes=noLikes+1;
    else
      noLikes=noLikes-1;
    notifyListeners();
  }
}
