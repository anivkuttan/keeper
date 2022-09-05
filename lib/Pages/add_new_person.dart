// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';

// class ImagePage extends StatefulWidget {
//   const ImagePage({Key? key}) : super(key: key);

//   @override
//   State<ImagePage> createState() => _ImagePageState();
// }

// class _ImagePageState extends State<ImagePage> {
//   File? image;
//   Future pickImage(ImageSource source) async {
//     try {
//       var imagePath = await ImagePicker().pickImage(source: source);
//       if (imagePath == null) return;
//       setState(() {
//         image = File(imagePath.path);
//       });
//     } on PlatformException catch (e) {
//       // ignore: avoid_print
//       print("$e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ImagePicker'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             image != null ? ClipOval(child: Image.file(image!)) : const FlutterLogo(size: 120),
//             ElevatedButton(
//               child: const Text('From Galary'),
//               onPressed: () {
//                 pickImage(ImageSource.gallery);
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 pickImage(ImageSource.camera);
//               },
//               child: const Text('From Camera'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keeper/Controllers/image_controller.dart';

class AddNewPerson extends StatelessWidget {
  const AddNewPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageController imageController = Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Person'),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<ImageController>(builder: (controller) {
              return CircleAvatar(
                radius: 40,
                child: controller.image != null ? Image.file(imageController.image!) : const Text("hollo"),
              );
            }),
            TextFormField(),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text('Cemara'),
              onPressed: () {
                imageController.pickImage(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }
}
