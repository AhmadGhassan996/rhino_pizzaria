import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rhinopizzaria/screens/google_map_screen/google_map_screen.dart';

class PizzaDescriptionScreen extends StatefulWidget {
  static const nameRoute='/pizza_desc_screen';

  const PizzaDescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PizzaDescriptionScreen> createState() => _PizzaDescriptionScreenState();
}

class _PizzaDescriptionScreenState extends State<PizzaDescriptionScreen> {
  var _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => GoogleMapWidget(index: 1)));
        },
        child: Icon(Icons.map),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: FlutterLogo(),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Titel'),
            SizedBox(
              height: 10,
            ),
            Text('desc'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //mince
                      },
                      icon: Icon(Icons.remove_circle),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("1"),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: () {
                        //add
                      },
                      icon: Icon(Icons.add_circle),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Jd: '),
                    SizedBox(
                      width: 2,
                    ),
                    Text("20"),
                    SizedBox(width: 10),
                  ],
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        Text('data1'),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                  RadioListTile(
                                    value: index,
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value.hashCode;
                                      });
                                    },
                                    title: Text('name'),
                                  )
                                ],
                              );
                            },
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                          ),
                        ),
                      ],
                    );
                  }),
            ),

            // const SizedBox(height: 200,width: double.infinity,child:GoogleMapWidget(index: 1,) ,),
          ],
        ),
      ),
    );
  }
}
