import 'package:shared_preferences/shared_preferences.dart';

class SharedCache {
  static late SharedPreferences _preferences;
  static SharedCache instance = SharedCache._internal();
  SharedCache._internal();
  factory SharedCache(){

    return instance;
  }
  static init()async{
    _preferences = await SharedPreferences.getInstance();
  }
Future<bool> saveData(key, value) async {
    print('///////////////////////////////');
    print(value);
    print('///////////////////////////////');
  switch (value.runtimeType) {
    case String:
     return  _preferences.setString(key, value);
    case bool :
      return  _preferences.setBool(key, value);
    case int :
      return  _preferences.setInt(key, value);
    case double:
      return _preferences.setDouble(key, value);
    default:
      throw(Exception());
  }
}

  Object? getData(String key){
    return _preferences.get(key);
  }
}