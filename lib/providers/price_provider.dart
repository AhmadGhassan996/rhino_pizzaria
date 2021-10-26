
import 'package:flutter/cupertino.dart';

class PriceProvider with ChangeNotifier {
  List<double> list = [];

  void addItem(double item) {
    list.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}