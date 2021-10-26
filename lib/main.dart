import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhinopizzaria/providers/auth_provider.dart';
import 'package:rhinopizzaria/providers/cat_list_provider.dart';
import 'package:rhinopizzaria/providers/item_provider.dart';
import 'package:rhinopizzaria/providers/list_provider.dart';
import 'package:rhinopizzaria/providers/options_provider.dart';
import 'package:rhinopizzaria/providers/pizza_provider.dart';
import 'package:rhinopizzaria/providers/price_provider.dart';
import 'package:rhinopizzaria/providers/product_provider.dart';
import 'package:rhinopizzaria/routs.dart';
import 'package:rhinopizzaria/screens/menu_screen/menu_screen.dart';
import 'package:rhinopizzaria/screens/menu_screen/wigets/pizza_desc.dart';
import 'package:rhinopizzaria/screens/options_screen/option_screen.dart';
import 'package:rhinopizzaria/screens/product_screen/product_screen.dart';
import 'package:rhinopizzaria/screens/register_screens/singup_screen.dart';
import 'package:rhinopizzaria/services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ListProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CatListProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PriceProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OptionProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PizzaProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SignUpScreen(),
        routes: routs,
      ),
    );
  }
}
