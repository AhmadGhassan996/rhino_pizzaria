import 'dart:io';

import 'package:rhinopizzaria/models/option_model.dart';

class ProductModel {
  File imgUrl;
  String title;
  String adminId;
  String id;
  Map<String, OptionModel> optionModel;
  String description;

  ProductModel(
      {required this.id,
        required this.imgUrl,
      required this.adminId,
      required this.title,
      required this.optionModel,
      required this.description});

  Map<String, dynamic> toJson() => {
        "aId": adminId,
        'img': imgUrl,
        'title': title,
        'desc': description,
        'option': Map.from(optionModel)
            .map((key, value) => MapEntry<String, dynamic>(key, value)),
      };

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
id: id,
        imgUrl: json['img'],
        title: json['title'],
        optionModel:Map.from(json['option']).map((key, value) =>
            MapEntry<String, OptionModel>(key, OptionModel.fromJson(value))),
        description: json['desc'],
        adminId: json['aId']);
  }
}
