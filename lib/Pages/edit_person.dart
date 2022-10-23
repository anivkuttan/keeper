import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Service/constance.dart';
import 'package:keeper/Widgets/alert_dialog.dart';

class EditPage extends StatefulWidget {
  final Person person;
  final int index;
  const EditPage({Key? key, required this.person, required this.index})
      : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  PersonController personController = Get.find<PersonController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Person'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  GetBuilder<PersonController>(builder: (controller) {
                    return ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(60),
                        child: controller.selectedImage == null
                            ? Image.memory(controller.localImage)
                            : Image.file(
                                controller.selectedImage!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    );
                  }),
                  Positioned(
                    bottom: -5,
                    right: -13,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kassentColor,
                          foregroundColor: Theme.of(context).primaryColor,
                          shape: const CircleBorder()),
                      child: const Icon(Icons.edit, size: 16),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DialogBox(
                                title: "Choose Image From",
                                firstButtonName: 'Camera',
                                firstButtonColor:
                                    Theme.of(context).primaryColor,
                                firstButtonTaped: () async {
                                  personController
                                      .pickImage(ImageSource.camera);

                                  personController.updatePerson(
                                    index: widget.index,
                                    person: widget.person
                                      ..personImage =
                                          personController.selectedImage == null
                                              ? null
                                              : personController.imageAsByts,
                                  );

                                  Navigator.pop(context);
                                },
                                secondButtonName: 'Gallery',
                                secondButtonColor:
                                    Theme.of(context).primaryColor,
                                secondButtonTaped: () {
                                  personController
                                      .pickImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
            Text(
              widget.person.personName,
              style: const TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: widget.person.listOfTask.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.person.listOfTask[index].taskName),
                      subtitle:
                          Text('${widget.person.listOfTask[index].taskAmount}'),
                      isThreeLine: true,
                      trailing:
                          Text('${widget.person.listOfTask[index].editedTime}'),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          personController.updatePerson(
              index: widget.index,
              person: widget.person
                ..personImage = personController.imageAsByts);
          SnackBar errorSnackBar = const SnackBar(
            content: Text('Susscessfuly Updated'),
          );
          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

//if(widget.person.personImage == null){
//  CircleAvatar(
//                           child: Text(
//                             person.personName[0].toUpperCase(),
//                           ),
//                         );
//                         }else if(controller.selectedImage != null){

// Image.file(
//                                 controller.selectedImage!,
//                                 fit: BoxFit.cover,
//                               ),
//                         }
                        // child: controller.selectedImage == null
                        //     ? Image.memory(widget.person.personImage!)
                        //     : Image.file(
                        //         controller.selectedImage!,
                        //         fit: BoxFit.cover,
                        //       ),
                        // child: 
                        //     ? Image.memory(
                        //         widget.person.personImage!,
                        //         fit: BoxFit.cover,
                        //       )
                        //     : Image.file(
                        //         controller.selectedImage!,
                        //         fit: BoxFit.cover,
                        //       ),