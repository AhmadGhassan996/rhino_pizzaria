import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhinopizzaria/providers/pizza_provider.dart';
import 'package:rhinopizzaria/screens/menu_screen/wigets/pizza_desc.dart';
import 'package:rhinopizzaria/services/pizza_response.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pizza = context.watch<PizzaProvider>();
    return pizza.pResponse.status == Status.LOADING
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: pizza.pResponse.data!.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, PizzaDescriptionScreen.nameRoute);

                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 5,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              //Text(pizza.pResponse.data![index].title), //Title
                              Text(pizza.pResponse.data![index].title),
                              Text(pizza
                                  .pResponse.data![index].description), //Desc
                            ],
                          ),
                          FlutterLogo(size: 100),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
  }
}
