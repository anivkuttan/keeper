import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Pages/add_new_person.dart';
import 'package:keeper/Pages/add_task_page.dart';
import 'package:keeper/Pages/delete_page.dart';
import 'package:keeper/Pages/view_notes.dart';
import 'package:keeper/Widgets/button.dart';

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
              Button(
                  buttonName: "View All Notes",
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return ViewNotes();
                    });
                    Navigator.of(context).push(route);
                  }),
              Button(
                buttonName: 'Add Task',
                onTap: () {
                  Route route = MaterialPageRoute(builder: (context) {
                    return const AddTaskPage(
                      buttonName: "All",
                    );
                  });
                  Navigator.push(context, route);
                },
              ),
              Button(
                buttonName: 'Delete Persons',
                onTap: () {
                  Route route = MaterialPageRoute(builder: (context) {
                    return const DeletePage();
                  });
                  Navigator.push(context, route);
                },
              ),
              Button(
                buttonName: 'Add New Person',
                onTap: () {
                  Route route = MaterialPageRoute(builder: (context) {
                    return const AddNewPerson();
                  });

                  Navigator.push(context, route);
                },
              ),
            ]),
      ),
    );
  }
}
