
import 'package:flutter/cupertino.dart';
import 'package:rhinopizzaria/models/option_model.dart';

class OptionProvider with ChangeNotifier{

  Map<String,OptionModel>? list;

  void setOptions(Map<String,OptionModel>  oList ){

    list=oList;
    notifyListeners();
  }



}