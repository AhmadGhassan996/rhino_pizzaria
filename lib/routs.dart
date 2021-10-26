import 'package:flutter/cupertino.dart';
import 'package:rhinopizzaria/screens/menu_screen/menu_screen.dart';
import 'package:rhinopizzaria/screens/menu_screen/wigets/pizza_desc.dart';
import 'package:rhinopizzaria/screens/options_screen/option_screen.dart';
import 'package:rhinopizzaria/screens/options_screen/widgets/save_widget.dart';
import 'package:rhinopizzaria/screens/product_screen/product_screen.dart';

Map<String, WidgetBuilder> routs = {
  ItemsSelect.namedRout: (ctx) => ItemsSelect(),
  Save.namedRout: (ctx) => Save(),
  MenuScreen.nameRoute: (ctx) => MenuScreen(),
  PizzaDescriptionScreen.nameRoute: (ctx) => PizzaDescriptionScreen(),
  ProductScreen.namedRout: (ctx) => ProductScreen(),
};
