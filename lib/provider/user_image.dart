import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImage with ChangeNotifier {
  File? image;
  UserImage({
      required this.image
});

}
class CurrentUserImage with ChangeNotifier {
  UserImage _currentUserImage = new UserImage(image: null);

  UserImage get currentUserImage {
    return _currentUserImage;
  }

  void currentuserImage(UserImage c) {
    _currentUserImage.image = c.image;


    notifyListeners();
  }

}
