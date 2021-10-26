import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rhinopizzaria/providers/image_provider.dart';
import 'package:rhinopizzaria/providers/product_provider.dart';

class ImagePickerr extends StatefulWidget {
  @override
  State<ImagePickerr> createState() => _ImagePickerrState();
}

class _ImagePickerrState extends State<ImagePickerr> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
            onTap:()  {
              pickImage();
            context.read<ProductProvider>().pickImage(image!);

            },
                child: const FlutterLogo(
                    size: 140,
                  ),
              )
        ],
      ),
    );
  }
}
