
class ItemModel{

  String title;
  double price;

  ItemModel(this.title, this.price);
  Map<String,dynamic> toJson()=>{


    'title':title,
    'price':price,
  //  Map.from(optionModel).map((key, value) => MapEntry<String,dynamic>(key, value.))
  };
  factory ItemModel.fromJson(Map<String,dynamic>json){
    return ItemModel(json['title'], json['price']);
  }
}