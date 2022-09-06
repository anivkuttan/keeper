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

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keeper/Controllers/image_controller.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';

class AddNewPerson extends StatefulWidget {
  const AddNewPerson({Key? key}) : super(key: key);

  @override
  State<AddNewPerson> createState() => _AddNewPersonState();
}

class _AddNewPersonState extends State<AddNewPerson> {
  ImageController imageController = Get.put(ImageController());
  final personController = Get.find<PersonController>();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    imageController.image = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Person'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GetBuilder<ImageController>(builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23),
                        ),
                        builder: (context) {
                          return SizedBox(
                            height: 100,
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.camera, size: 50),
                                    onPressed: () {
                                      imageController.pickImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.library_books_outlined, size: 50),
                                    onPressed: () {
                                      imageController.pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ]),
                          );
                        });
                  },
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(80),
                      child: controller.image == null
                          ? const CircleAvatar()
                          : Image.file(
                              controller.image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 30),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                validator: (currentText) {
                  if (currentText == null || currentText.isEmpty) {
                    return "Please Enter Name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  bool isValidated = formKey.currentState!.validate();
                  if (isValidated) {
                    final editedTime = DateTime.now();
                    String editedTime1 =
                        "${editedTime.day}/${editedTime.month}/${editedTime.year} Time : ${editedTime.hour}:${editedTime.minute}";
                    log("Anikuttan First line okay ");
                    Person newPereon = Person(
                      personName: _nameController.text,
                      personAmount: 0,
                      listOfTask: [
                        Task(taskName: "Just Created", taskAmount: 0, editedTime: editedTime1),
                      ],
                      personImage: imageController.image == null
                          ? null
                          : Image.file(
                              imageController.image!,
                              fit: BoxFit.cover,
                            ),
                    );
                    log("Ainkuttan This line okay");
                    personController.personList.add(newPereon);
                    log('person list added');
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Person '),
              )
            ],
          ),
        ),
      ),
    );
  }
}