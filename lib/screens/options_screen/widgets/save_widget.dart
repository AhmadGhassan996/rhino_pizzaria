import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhinopizzaria/models/product_model.dart';
import 'package:rhinopizzaria/providers/item_provider.dart';
import 'package:rhinopizzaria/providers/options_provider.dart';
import 'package:rhinopizzaria/providers/product_provider.dart';
import 'package:rhinopizzaria/screens/menu_screen/menu_screen.dart';
import 'package:rhinopizzaria/services/pizza_servce.dart';

class Save extends StatefulWidget {
  static const String namedRout = '/test_screen';

  const Save({Key? key}) : super(key: key);

  @override
  _SaveState createState() => _SaveState();
}

late ProductModel model;

class _SaveState extends State<Save> {
  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model = ProductModel(
      id: '',
        imgUrl: context.watch<ProductProvider>().image!,
        adminId: '123',
        title:context.watch<ProductProvider>().title!,
        optionModel: context.watch<OptionProvider>().list!,
        description: context.watch<ProductProvider>().description!);
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          PizzaService().postProduct(model);
          Navigator.pushNamed(context, MenuScreen.nameRoute);
        },
        child: Text('save'),
      ),
    ));
  }
}
