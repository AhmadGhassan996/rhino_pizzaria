

import 'dart:convert';

import 'package:http/http.dart';
import 'package:rhinopizzaria/models/product_model.dart';


class PizzaService{


  Future<List<ProductModel>> getPizza() async {
    List<ProductModel> temp = [];

    var res =await get(Uri.parse(
        'https://pizzaria-30b01-default-rtdb.firebaseio.com/product.json'));

    var stringJson= json.decode(res.body)as Map<String,dynamic>;
    for (var x in stringJson.keys) {
      temp.add(ProductModel.fromJson(stringJson[x], x));
    }
    return temp;
  }

  Future<ProductModel?> postProduct(
      ProductModel productModel) async {
    var respone = await post(
        Uri.parse(
            'https://pizzaria-30b01-default-rtdb.firebaseio.com/product.json'),
        body: json.encode(
            productModel.toJson()));

    if (respone.statusCode == 200) {
    }
    return null;
  }



}