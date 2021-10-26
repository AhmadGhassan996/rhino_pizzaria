
import 'package:flutter/material.dart';
import 'package:rhinopizzaria/providers/pizza_provider.dart';
import 'package:rhinopizzaria/screens/menu_screen/wigets/menu_body.dart';
import 'package:provider/provider.dart';
class MenuScreen extends StatefulWidget {

  static const nameRoute='/menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}


class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<PizzaProvider>().getPizza();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:MenuBody(),
    );
  }
}
