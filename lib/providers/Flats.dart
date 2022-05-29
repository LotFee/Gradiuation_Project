import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sakkeny/providers/flat.dart';
import 'package:http/http.dart' as http ;

class Flats with ChangeNotifier{

  List<Flat> _posts=[


  ];
  List<Flat> _searchResult=[

  ];
  List<Flat> get searchResult{
    return [..._searchResult];
  }
  List<Flat> get posts{
    return [..._posts];
  }
  List<Flat> get onlyFavPosts{
    return _posts.where((flatItem) => flatItem.isFav).toList();
  }
  List<Flat>  userPosts(var id){
    return _posts.where((flatItem) => flatItem.ownerId==id).toList();
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
    if(response.statusCode==200)
      {
        final List<Flat> loadedFlats=[] ;
        //print(extractData['Dpost'][0][0]['url']);
        var i = extractData['Dpost'].length;
         print(extractData['Dpost'][0][0]['ownerId']);
        for(var j =0 ; j < i ; j++)
        {
          print(extractData['Dpost'][j][0]['url']);
          String userName = extractData['Dpost'][j][2];
          loadedFlats.add(Flat(
            id: extractData['Dpost'][j][0]['_id'],
            price: extractData['Dpost'][j][0]['price'].toDouble(),
            ownerId: extractData['Dpost'][j][0]['ownerId'],
            userName: userName ,
            userImage: extractData['Dpost'][j][3],
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
            noComments: extractData['Dpost'][j][1],
              locationOnMap: extractData['Dpost'][j][0]['locationMap']
          ));
        }

        _posts=loadedFlats;
        print(loadedFlats.length.toString());
        notifyListeners();
        print(extractData);
      }

    }catch(error){

      throw(error.toString());
    }
  }
  Future<void> getSearchResult (String url) async{
    try {
      final response =   await http.get(Uri.parse(url));
      final extractData = jsonDecode(response.body);
      if(response.statusCode==200)
      {
        final List<Flat> loadedFlats=[] ;
        //print(extractData['Dpost'][0][0]['url']);
        var i = extractData['Dpost'].length;
        print(extractData['Dpost'][0][0]['ownerId']);
        for(var j =0 ; j < i ; j++)
        {
          print(extractData['Dpost'][j][0]['url']);
          String userName = extractData['Dpost'][j][2];
          loadedFlats.add(Flat(
              id: extractData['Dpost'][j][0]['_id'],
              price: extractData['Dpost'][j][0]['price'].toDouble(),
              ownerId: extractData['Dpost'][j][0]['ownerId'],
              userName: userName ,
              userImage: extractData['Dpost'][j][3],
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
              noComments: extractData['Dpost'][j][1],
            locationOnMap: extractData['Dpost'][j][0]['locationMap']
          ));
        }

        _searchResult=loadedFlats;
        print(loadedFlats.length.toString());
        notifyListeners();
        print(extractData);
      }

    }catch(error){

      throw(error.toString());
    }
  }
}