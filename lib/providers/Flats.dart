import 'package:flutter/material.dart';
import 'package:sakkeny/providers/flat.dart';

class Flats with ChangeNotifier{
  List<Flat> _posts=[
    Flat(
      id: "f1",
      userName: "Mohamed Lotfy",
      time: DateTime.now(),
      location: "ismalia - El20ny",
      images: [
        "images/f1.jpg",
        "images/f2.jpg",
        "images/f3.jpg",
        "images/f4.jpg",
      ],
      price: 1500,
      isFav: false,
      bathroom: 3,
      bed: 6,
      bedrooms: 1,
      wifi: true,
      tv: true,
      cond: false,
      description: "This Apartment in Ismalia - EL20ny  is suitable for you.  ",
    ),
    Flat(
      id: "f2",
      userName: "Hamed Ahmed",
      time: DateTime.now(),
      location: "ismalia - Nemra 6",
      images: [
        "images/f2.jpg",
        "images/f1.jpg",
        "images/f3.jpg",
        "images/f4.jpg",
      ],
      price: 2300,
      isFav: false,
      bathroom: 3,
      bed: 6,
      bedrooms: 1,
      wifi: true,
      tv: true,
      cond: false,
      description: "This Apartment in Ismalia - Nemra 6  is suitable for you.",
    ),
    Flat(
      id: "f3",
      userName: "Ahmed ElBaz",
      time: DateTime.now(),
      location: "ismalia - ELSoltan",
      images: [
        "images/f4.jpg",
        "images/f3.jpg",
        "images/f2.jpg",
        "images/f1.jpg",
      ],
      price: 1750,
      isFav: false,
      bathroom: 3,
      bed: 6,
      bedrooms: 1,
      wifi: true,
      tv: true,
      cond: true,
      description: "This Apartment in Ismalia - EL5a  is suitable for you.",
    ),
    Flat(
      id: "f4",
      userName: "Wael Ismael",
      time: DateTime.now(),
      location: "ismalia - EL5a",
      images: [
        "images/f3.jpg",
        "images/f4.jpg",

        "images/f2.jpg",
        "images/f1.jpg",
      ],
      price: 1900,
      isFav: false,
      bathroom: 3,
      bed: 6,
      bedrooms: 1,
      wifi: true,
      tv: true,
      cond: true,
      description: "This Apartment in Ismalia - EL5a  is suitable for you.",
    ),
    Flat(
      id: "f5",
      userName: "BeBo",
      time: DateTime.now(),
      location: "ismalia - Elgam3yat",
      images: [
        "images/f1.jpg",
        "images/f4.jpg",
        "images/f3.jpg",
        "images/f2.jpg",

      ],
      price: 2200,
      isFav: false,
      bathroom: 3,
      bed: 6,
      bedrooms: 1,
      wifi: true,
      tv: true,
      cond: true,
      description: "This Apartment in Ismalia - ElGam3yat  is suitable for you.",
    ),
    Flat(
      id: "f6",
      userName: "Hatanoda",
      time: DateTime.now(),
      location: "ismalia - ELSalam",
      images: [
        "images/f4.jpg",
        "images/f3.jpg",
        "images/f2.jpg",
        "images/f1.jpg",
      ],
      price: 2000,
      isFav: false,
      bathroom: 3,
      bed: 6,
      bedrooms: 1,
      wifi: true,
      tv: true,
      cond: true,
      description: "This Apartment in Ismalia - ELSalam  is suitable for you.",
    ),

  ];
  List<Flat> get posts{
    return [..._posts];
  }
  List<Flat> get onlyFavPosts{
    return _posts.where((flatItem) => flatItem.isFav).toList();
  }

  Flat findById(String id){
    return _posts.firstWhere((element) => element.id==id);
  }

  void addPost(){
    notifyListeners();
  }
}