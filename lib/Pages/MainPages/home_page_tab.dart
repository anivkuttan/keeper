import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Pages/edit_person.dart';
import 'package:keeper/Pages/view_person_page.dart';

import 'package:keeper/Widgets/circle_avatar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePageTabView extends StatelessWidget {
  HomePageTabView({Key? key}) : super(key: key);

  final PersonController controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PersonController>(
        builder: (controller) {
          if (controller.personBoxCount == 0) {
            return const Center(
              child: Text('Empty List'),
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              log("personBoxCount ${controller.personBoxCount}");

              return PersonCard(index: index);
            }),
            itemCount: controller.personBoxCount,
            separatorBuilder: (context, index) {
              return const Divider(height: 20);
            },
          );
        },
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final int index;
  final PersonController controller = Get.find<PersonController>();

  final SizedBox space5 = const SizedBox(height: 5);
  PersonCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Person? person = controller.personBox.getAt(index);

    return GestureDetector(
      onTap: (() {
        Route route = MaterialPageRoute(builder: (context) {
          return ViewPage(
            person: person!,
            index: index,
          );
        });

        Navigator.push(context, route);
      }),
    
      child: Slidable(
        startActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            icon: Icons.edit,
            label: 'Edit',
            flex: 1,
            backgroundColor: Theme.of(context).primaryColor,
            
            onPressed: (context) {
                Route route = MaterialPageRoute(builder: (context) {
          return EditPage(
            person: person!,
            index: index,
          );
        });

        Navigator.push(context, route);
            },
          ),
          SlidableAction(
            icon: Icons.delete,
            label: 'Delete',
            flex: 1,
            backgroundColor: Colors.red,
            onPressed: (context) {
              // controller.deletePerson(index: index,);
            },
          )
        ]),
        child: Card(
          // color: person!.personAmount.isNegative
          //     ? Colors.red[300]
          //     : const Color.fromARGB(255, 33, 216, 39),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person!.personName,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    space5,
                    Text(person.personAmount.isNegative
                        ? "Balance : ${person.personAmount}"
                        : "Advance : ${person.personAmount}"),
                    space5,
                    Text(
                      "last Added Task : ${person.listOfTask.last.taskName}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    space5,
                    Text(
                      "EditedTime : ${person.listOfTask.last.editedTime}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    space5,
                  ],
                ),
                const Spacer(),
                CircleImage(
                  circleRadius: 50,
                  boderWidth: 5,
                  backgroundColor: person.personAmount.isNegative
                      ? Colors.red
                      : const Color.fromARGB(255, 54, 215, 59),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
