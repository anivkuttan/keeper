import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';
import 'package:keeper/Pages/add_task_page.dart';

class QuickPageTabView extends StatelessWidget {
  QuickPageTabView({Key? key}) : super(key: key);
  final controller = Get.find<PersonController>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('View All Notes'),
                ),
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const AddTaskPage();
                    });
                    Navigator.push(context, route);
                  },
                  child: const Text('Add Task to SomeOne'),
                ),
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const AddTaskPage();
                    });
                    Navigator.push(context, route);
                  },
                  child: const Text('Add Task to All'),
                ),
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _nameController.clear();
                    showAddingPage(context);
                  },
                  child: const Text('Add New Person to List'),
                ),
              ),
            ]),
      ),
    );
  }

  showAddingPage(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context) {
          return Container(
            height: 600,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(children: [
                  const CircleAvatar(
                    radius: 45,
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: const Text("Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Person newPereon = Person(personName: _nameController.text, personAmount: 0, listOfTask: [
                        Task(taskName: "Just Created", taskAmount: 0, editedTime: DateTime.now()),
                      ]);
                      controller.personList.add(newPereon);

                      Navigator.pop(context);
                    },
                    child: const Text("Add New Person"),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
