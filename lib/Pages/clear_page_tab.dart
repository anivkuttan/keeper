import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Controllers/image_controller.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Model/person.dart';

class ClearPageTabView extends StatefulWidget {
  const ClearPageTabView({Key? key}) : super(key: key);

  @override
  State<ClearPageTabView> createState() => _ClearPageTabViewState();
}

class _ClearPageTabViewState extends State<ClearPageTabView> {
  ImageController imageController = Get.put(ImageController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<PersonController>(
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.personBoxCount,
                    itemBuilder: (context, index) {
                      Person? person = controller.personBox.getAt(index);
                      return ListTile(
                        title: Text(person!.personName),
                        leading: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(20),
                            child: person.personImage != null
                                ? Image.memory(
                                    person.personImage!,
                                    fit: BoxFit.cover,
                                  )
                                : CircleAvatar(
                                    child: Text(
                                      person.personName[0].toUpperCase(),
                                    ),
                                  ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
