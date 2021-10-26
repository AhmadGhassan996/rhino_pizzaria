
import 'dart:io';

import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{

  File? image;

  String? title;
  String? description;

  void pickImage( File image)  {
    this.image= image;
    notifyListeners();
  }
  void pickTitle( String title){
   this.title=title;
    notifyListeners();

  }
  void pickDescription( String desc){
    description= desc;
    notifyListeners();

  }


}