import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      var imagePath = await ImagePicker().pickImage(source: source);
      if (imagePath == null) return;
      image = File(imagePath.path);
      update();
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Anikuttan Error from ImagePicker this is Error =>$e");
    }
  }
}
