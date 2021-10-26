//

import 'package:flutter/cupertino.dart';

class ListProvider with ChangeNotifier {
  List<String> list = [];

  void addItem(String item) {
    list.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}


// import 'package:flutter/cupertino.dart';
//
// class ListProvider with ChangeNotifier {
//   List <String> list =[];
//
//   void addToList(String item){
//     list.add(item);
//     notifyListeners();
//   }
//
//   void deleteItem(int index){
//     list.removeAt(index);
//     notifyListeners();
//
//   }
//
//
// }