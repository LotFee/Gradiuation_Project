import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sakkeny/providers/flat.dart';
import 'package:http/http.dart' as http ;

class Flats with ChangeNotifier{

  List<Flat> _posts=[
    // Flat(
    //   id: "f1",
    //   userName: "Mohamed Lotfy",
    //   time: DateTime.now(),
    //   location: "ismalia - El20ny",
    //   images: [
    //     "images/f1.jpg",
    //     "images/f2.jpg",
    //     "images/f3.jpg",
    //     "images/f4.jpg",
    //   ],
    //   price: 1500,
    //   isFav: false,
    //   bathroom: 3,
    //   bed: 6,
    //   bedrooms: 1,
    //   wifi: true,
    //   tv: true,
    //   cond: false,
    //   description: "This Apartment in Ismalia - EL20ny  is suitable for you.  ",
    // ),
    // Flat(
    //   id: "f2",
    //   userName: "Hamed Ahmed",
    //   time: DateTime.now(),
    //   location: "ismalia - Nemra 6",
    //   images: [
    //     "images/f2.jpg",
    //     "images/f1.jpg",
    //     "images/f3.jpg",
    //     "images/f4.jpg",
    //   ],
    //   price: 2300,
    //   isFav: false,
    //   bathroom: 3,
    //   bed: 6,
    //   bedrooms: 1,
    //   wifi: true,
    //   tv: true,
    //   cond: false,
    //   description: "This Apartment in Ismalia - Nemra 6  is suitable for you.",
    // ),
    // Flat(
    //   id: "f3",
    //   userName: "Ahmed ElBaz",
    //   time: DateTime.now(),
    //   location: "ismalia - ELSoltan",
    //   images: [
    //     "images/f4.jpg",
    //     "images/f3.jpg",
    //     "images/f2.jpg",
    //     "images/f1.jpg",
    //   ],
    //   price: 1750,
    //   isFav: false,
    //   bathroom: 3,
    //   bed: 6,
    //   bedrooms: 1,
    //   wifi: true,
    //   tv: true,
    //   cond: true,
    //   description: "This Apartment in Ismalia - EL5a  is suitable for you.",
    // ),
    // Flat(
    //   id: "f4",
    //   userName: "Wael Ismael",
    //   time: DateTime.now(),
    //   location: "ismalia - EL5a",
    //   images: [
    //     "images/f3.jpg",
    //     "images/f4.jpg",
    //
    //     "images/f2.jpg",
    //     "images/f1.jpg",
    //   ],
    //   price: 1900,
    //   isFav: false,
    //   bathroom: 3,
    //   bed: 6,
    //   bedrooms: 1,
    //   wifi: true,
    //   tv: true,
    //   cond: true,
    //   description: "This Apartment in Ismalia - EL5a  is suitable for you.",
    // ),
    // Flat(
    //   id: "f5",
    //   userName: "BeBo",
    //   time: DateTime.now(),
    //   location: "ismalia - Elgam3yat",
    //   images: [
    //     "images/f1.jpg",
    //     "images/f4.jpg",
    //     "images/f3.jpg",
    //     "images/f2.jpg",
    //
    //   ],
    //   price: 2200,
    //   isFav: false,
    //   bathroom: 3,
    //   bed: 6,
    //   bedrooms: 1,
    //   wifi: true,
    //   tv: true,
    //   cond: true,
    //   description: "This Apartment in Ismalia - ElGam3yat  is suitable for you.",
    // ),
    // Flat(
    //   id: "f6",
    //   userName: "Hatanoda",
    //   time: DateTime.now(),
    //   location: "ismalia - ELSalam",
    //   images: [
    //     "images/f4.jpg",
    //     "images/f3.jpg",
    //     "images/f2.jpg",
    //     "images/f1.jpg",
    //   ],
    //   price: 2000,
    //   isFav: false,
    //   bathroom: 3,
    //   bed: 6,
    //   bedrooms: 1,
    //   wifi: true,
    //   tv: true,
    //   cond: true,
    //   description: "This Apartment in Ismalia - ELSalam  is suitable for you.",
    // ),

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
  Future<void> getPosts () async{
    try {
      const url = "https://afternoon-ridge-73830.herokuapp.com/posts";
    final response =   await http.get(Uri.parse(url));
    final extractData = jsonDecode(response.body);
    final List<Flat> loadedFlats=[] ;
    //print(extractData['Dpost'][0][0]['url']);
      var i = extractData['Dpost'].length;
      for(var j =0 ; j < i ; j++)
        {
          String userName = extractData['Dpost'][j][1];
          var name = userName.split(" ").first + " " +userName.split(" ").last;
          loadedFlats.add(Flat(
            id: extractData['Dpost'][j][0]['_id'],
            price: extractData['Dpost'][j][0]['price'].toDouble(),
            userName: name,
            userImage: extractData['Dpost'][j][2],
            description: extractData['Dpost'][j][0]['description'],
            cond: extractData['Dpost'][j][0]['conditioner'],
            tv: extractData['Dpost'][j][0]['tv'],
            wifi: extractData['Dpost'][j][0]['wifi'],
            bedrooms: extractData['Dpost'][j][0]['numberofbedrooms'],
            bed: extractData['Dpost'][j][0]['numberofbeds'],
            bathroom: 1,
            isFav: false,
            location: extractData['Dpost'][j][0]['location'],
            images: extractData['Dpost'][j][0]['url'],
            time: DateTime.now(),
          ));
        }

      _posts=loadedFlats;
      print(loadedFlats.length.toString());
      notifyListeners();
    print(extractData);
    }catch(error){
      throw(error.toString());
    }
  }
}