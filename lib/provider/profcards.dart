import 'package:flutter/material.dart';
import 'profCard.dart';

class Profcards with ChangeNotifier{
  List <ProfCard> _items = [
    ProfCard(
        id: '1',
        fName:'hamed',
        lName:'ahmed',
        gender:'0',
        age:0,
        email:'@gmail',
        password:'***',
    ),
  ];

  List <ProfCard> get items{
    return [..._items];
  }
  ProfCard findById (String id){
    return _items.firstWhere((prod) => prod.id== id);
  }
  void updateProduct(String id,ProfCard newProduct){
    final prodIndex=_items.indexWhere((prod) => prod.id==id);
    if(prodIndex>=0){
      _items[prodIndex]=newProduct;
      notifyListeners();
    }else{
      print('...');
    }
  }
}