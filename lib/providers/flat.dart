

import 'package:flutter/material.dart';

class Flat with ChangeNotifier{
  final String id;
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
  final bool wifi;
  final bool tv;
  final bool cond;
  final String description;

  Flat(
      {
        required this.price,
       required this.id,
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
      });

  void toggleFavState(){
    isFav = !isFav;
    notifyListeners();
  }
}
