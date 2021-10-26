import 'package:rhinopizzaria/models/item_model.dart';

class OptionModel {
  String title;
  Map<String, ItemModel> itemModel;
  bool isRequired;
  bool selectMany;

  //bool selectZeroOrMore;

  OptionModel(
    this.title,
    this.itemModel,
    this.isRequired,
    this.selectMany,
  );

  Map<String, dynamic> toJson() => {
        'title': title,
        'req': isRequired,
        'many': selectMany,
        'items': Map.from(itemModel)
            .map((key, value) => MapEntry<String, dynamic>(key, value)),
      };

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
        json['title'],
        Map.from(json['items']).map((key, value) =>
            MapEntry<String, ItemModel>(key, ItemModel.fromJson(value))),
        json['req'],
        json['many']);
  }
}
