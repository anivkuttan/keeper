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
              return PersonCard(index: index);
            }),
            itemCount: controller.personBoxCount,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
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
  // final DeleteController deleteController = Get.put(DeleteController());

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
            from: "EDITED_PAGE",
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
              controller.deletePerson(index: index, deletedPerson: person);
            },
          )
        ]),
        child: Card(
         
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    color: person!.personAmount.isNegative
                        ? Colors.red
                        : Theme.of(context).primaryColor,
                    width: 6,
                    height: 90),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.personName,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      space5,
                      Text(person.personAmount.isNegative
                          ? "Balance : ${person.personAmount}"
                          : "Advance : ${person.personAmount}"),
                      space5,
                      Row(
                        children: [
                          Text(
                            "last Task :",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              person.listOfTask.last.taskName,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      space5,
                      Text(
                        'Edited at:${person.listOfTask.last.editedTime}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      space5,
                    ],
                  ),
                ),
                const Spacer(),
                CircleImage(
                  circleRadius: 50,
                  boderWidth: 3,
                 
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
