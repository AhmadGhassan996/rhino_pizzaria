import 'dart:io';
import 'package:path/path.dart'as path;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhinopizzaria/models/dynamic_list.dart';
import 'package:rhinopizzaria/models/image_model.dart';
import 'package:rhinopizzaria/models/item_model.dart';
import 'package:rhinopizzaria/models/option_model.dart';
import 'package:rhinopizzaria/models/price_model.dart';
import 'package:rhinopizzaria/models/product_model.dart';
import 'package:rhinopizzaria/providers/item_provider.dart';
import 'package:rhinopizzaria/providers/list_provider.dart';
import 'package:rhinopizzaria/providers/options_provider.dart';
import 'package:rhinopizzaria/providers/price_provider.dart';
import 'package:rhinopizzaria/providers/product_provider.dart';
import 'package:rhinopizzaria/screens/options_screen/widgets/save_widget.dart';
import 'package:rhinopizzaria/services/pizza_servce.dart';

class ItemsSelect extends StatefulWidget {
  static const String namedRout = '/item_screen';

  @override
  _ItemsSelectState createState() => _ItemsSelectState();
}

class _ItemsSelectState extends State<ItemsSelect> {
  String optionTitle = '';

  var _value = 1;

  void getOpTitle(String opTitle) {
    optionTitle = opTitle;
  }

  late GlobalKey<FormState> _formKey;
  late TextEditingController _controller;
  late GlobalKey<FormState> _globalKey;
  late TextEditingController _controller1;
  var taskItems;
  int counter = 0;
  late DynamicList listClass;
  var price;
  late PriceModel priceList;
  var option;
  Map<String, ItemModel> map = {};
  Map<String, OptionModel> optionMap = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    price = Provider.of<PriceProvider>(context, listen: false);
    _formKey = GlobalKey();
    _controller = TextEditingController();
    _globalKey = GlobalKey();
    _controller1 = TextEditingController();
    taskItems = Provider.of<ListProvider>(context, listen: false);
    listClass = DynamicList(taskItems.list);
    priceList = PriceModel(price.list);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<ProductProvider>().image;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              // Text('${context.watch<ProductProvider>().title}'),
              // Text('${context.watch<ProductProvider>().image}'),
              // Text('${context.watch<ProductProvider>().description}'),
              SizedBox(
                height: 20,
              ),

              TextField(
                onChanged: getOpTitle,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                  hintText: 'Add option Title',
                ),
              ),

              const SizedBox(
                height: 10,
                child: Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 30,
                  height: 5,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value.hashCode;
                          });
                        },
                      ),
                      Text('Required'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value.hashCode;
                          });
                        },
                      ),
                      Text('Not Required'),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Radio(
                  //       value: 3,
                  //       groupValue: _value,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _value = value.hashCode;
                  //         });
                  //       },
                  //     ),
                  //     Text('Many'),
                  //   ],
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      hintText: 'Add item title',
                    ),
                    controller: _controller,
                    onSaved: (val) {
                      taskItems.addItem(val);
                    },
                    validator: (val) {
                      if (val!.length > 0) {
                        return null;
                      } else
                        return 'Add a text';
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _globalKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      hintText: 'Add price ',
                    ),
                    controller: _controller1,
                    onSaved: (val) {
                      price.addItem(double.parse(val!));
                      //  context.read<ItemProvider>().setOptions(oList)
                    },
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val!.length > 0) {
                        return null;
                      } else
                        return 'Add a text';
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                    }

                    //      context.read<ItemProvider>().setOptions({"items":ItemModel(taskItems, price)});

                    // context.read<ItemProvider>().setOptions(priceList.list)
                  },
                  child: Text('Add Items'),
                ),
              ),
              Consumer<ListProvider>(builder: (context, provider, listTile) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: listClass.list.length,
                    itemBuilder: buildList,
                  ),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<OptionProvider>().setOptions({
                          optionTitle: OptionModel(
                            optionTitle,
                            map,
                            false,
                            true,
                          )
                        });
                        //  print(context.watch<OptionProvider>().options.toString());
                     //   upLoadImage(watch);
                        Navigator.pushNamed(context, Save.namedRout);
                      },
                      child: Text("save")),
                ],
              ),
              Text(map.length.toString()),
            ],
          ),
        ));
  }

  Widget buildList(BuildContext context, int index) {
    counter++;
    map[listClass.list[index]] =
        ItemModel(listClass.list[index], priceList.list[index]);
    optionMap[optionTitle] = OptionModel(
      optionTitle,
      map,
      false,
      true,
    );

    return Dismissible(
      key: Key(counter.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        taskItems.deleteItem(index);
        price.deleteItem(index);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Item title : ${listClass.list[index].toString()}"),
                Text("Item price : ${priceList.list[index].toString()}"),
              ],
            ),
            // Text('j')
          ],
        ),
      ),
    );
  }
}
