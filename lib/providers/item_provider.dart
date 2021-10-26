

import 'package:flutter/cupertino.dart';
import 'package:rhinopizzaria/models/item_model.dart';
import 'package:rhinopizzaria/models/option_model.dart';

class ItemProvider with ChangeNotifier{

  Map<String,ItemModel>? list;

  void setOptions(Map<String,ItemModel>  oList ){

    list=oList;
    notifyListeners();
  }



}