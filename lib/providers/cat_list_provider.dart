

import 'package:flutter/cupertino.dart';

class CatListProvider with ChangeNotifier {
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
