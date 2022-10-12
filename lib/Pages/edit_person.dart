import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keeper/Controllers/image_controller.dart';
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
  ImageController imageController = Get.put(ImageController());
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
              child: Hero(
                tag: "Image",
                child: Stack(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(60),
                        child: widget.person.personImage != null
                            ? Image.memory(
                                widget.person.personImage!,
                                fit: BoxFit.cover,
                              )
                            : CircleAvatar(
                                child: Text(
                                  widget.person.personName[0].toUpperCase(),
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kassentColor,
                            foregroundColor: Theme.of(context).primaryColor,
                            shape:const CircleBorder()),
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
                                  firstButtonTaped: () {
                                    imageController
                                        .pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  secondButtonName: 'Gallery',
                                  secondButtonColor:
                                      Theme.of(context).primaryColor,
                                  secondButtonTaped: () {
                                    imageController
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
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
