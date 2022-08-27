import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  File? imageFile;
  
  Future pickImage(ImageSource imageSource) async {
    XFile? imagePath = await ImagePicker().pickImage(source: imageSource);
    if (imagePath == null) return;
    imageFile = File(imagePath.path);
                                        

  }
 
}
// 