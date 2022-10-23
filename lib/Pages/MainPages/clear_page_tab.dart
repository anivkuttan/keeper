import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Pages/view_person_page.dart';
import 'package:keeper/Widgets/circle_avatar.dart';

import '../../Model/person.dart';

class ClearPageTabView extends StatefulWidget {
  const ClearPageTabView({Key? key}) : super(key: key);

  @override
  State<ClearPageTabView> createState() => _ClearPageTabViewState();
}

class _ClearPageTabViewState extends State<ClearPageTabView> {
  Box<Person> deletedBox = Hive.box<Person>('DeletedBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PersonController>(builder: (controller) {
        return ListView.builder(
            itemCount: deletedBox.length,
            itemBuilder: (context, index) {
              Person? person = deletedBox.getAt(index);
              return Slidable(
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      icon: Icons.delete,
                      label: 'Delete',
                      flex: 1,
                      backgroundColor: Colors.red,
                      onPressed: (context) {
                        controller.deleteFromDeleteBox(index: index);
                      },
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(person!.personName),
                  subtitle: Text('Amounnt ${person.personAmount}'),
                  trailing: CircleImage(
                    circleRadius: 30,
                    child: person.personImage != null
                        ? Image.memory(
                            person.personImage!,
                            fit: BoxFit.cover,
                          )
                        : Image.memory(controller.localImage),
                  ),
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return ViewPage(
                        person: person,
                        index: index,
                        from: "DELETED_PAGE",
                      );
                    });

                    Navigator.push(context, route);
                  },
                ),
              );
            });
      }),
    );
  }
}
