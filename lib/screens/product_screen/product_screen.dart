import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rhinopizzaria/models/image_model.dart';
import 'package:rhinopizzaria/providers/product_provider.dart';
import 'package:rhinopizzaria/screens/options_screen/option_screen.dart';
import 'package:rhinopizzaria/screens/product_screen/widgets/image_picker.dart';
import 'package:rhinopizzaria/screens/product_screen/widgets/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class ProductScreen extends StatefulWidget {
  static const String namedRout = '/product_screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String pTitle = '';

  String pDescription = '';

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) {
        return;
      }
      final imagePath = File(image.path);
      setState(() {
        this.image = imagePath;
      });
    } on PlatformException catch (e) {
      print('Flaid');
    }
  }

  void getTitle(String title) {
    pTitle = title;
  }

  void getDescription(String description) {
    pDescription = description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                image != null
                    ? ClipOval(
                        child: Image.file(
                          image!,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          pickImage();
                          // context.read<ProductProvider>().pickImage(image!);
                        },
                        child: const FlutterLogo(
                          size: 140,
                        ),
                      )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: getTitle,
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
              hintText: 'Add product Title',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: getDescription,
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
              hintText: 'Add product Description',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ProductProvider>().pickDescription(pDescription);
                context.read<ProductProvider>().pickTitle(pTitle);
                context.read<ProductProvider>().pickImage(image!);

                upLoadImage();
                Navigator.pushNamed(context, ItemsSelect.namedRout);
              },
              child: const Text('Go To Options')),
        ],
      ),
    );
  }

  Future upLoadImage()async{
    if(image==null){
      return;
    }
    final imageName= image;
    final dest='image/$imageName';

    ImageToFirebase.uploadFile(dest, image!);

  }

}
