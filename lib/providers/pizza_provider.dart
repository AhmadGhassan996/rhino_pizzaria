import 'package:flutter/cupertino.dart';
import 'package:rhinopizzaria/models/product_model.dart';
import 'package:rhinopizzaria/services/pizza_response.dart';
import 'package:rhinopizzaria/services/pizza_servce.dart';


class PizzaProvider with ChangeNotifier {
  bool isLoading = true;
  PizzaService _pizzaService = PizzaService();
  PResponse<List<ProductModel>> pResponse = PResponse.fresh();

  void getPizza() async {
    try {
      pResponse = PResponse.loading();
      var res = await _pizzaService.getPizza();
      pResponse = PResponse.completed(res);
    } catch (ex) {
      PResponse.error("something went wrong");
    } finally {
      notifyListeners();
    }
  }
}
