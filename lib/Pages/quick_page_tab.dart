import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Pages/add_new_person.dart';
import 'package:keeper/Pages/add_task_page.dart';
import 'package:keeper/Pages/delete_page.dart';
import 'package:keeper/Pages/view_notes.dart';

class QuickPageTabView extends StatelessWidget {
  QuickPageTabView({Key? key}) : super(key: key);
  final controller = Get.find<PersonController>();

  final GlobalKey<FormState> formKey = GlobalKey();

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
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return ViewNotes();
                    });
                    Navigator.of(context).push(route);
                  },
                  child: const Text('View All Notes'),
                ),
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const AddTaskPage(
                        buttonName: "All",
                      );
                    });
                    Navigator.push(context, route);
                  },
                  child: const Text('Add Task'),
                ),
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const DeletePage();
                    });
                    Navigator.push(context, route);
                  },
                  child: const Text('Delete Persons'),
                ),
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const AddNewPerson();
                    });

                    Navigator.push(context, route);
                  },
                  child: const Text('Add New Person'),
                ),
              ),
            ]),
      ),
    );
  }
}
