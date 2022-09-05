import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:keeper/Controllers/person_controller.dart';

class HomePageTabView extends StatelessWidget {
  HomePageTabView({Key? key}) : super(key: key);

  final PersonController controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.pink,
      alignment: Alignment.center,
      child: Obx(() {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return PersonCard(index: index);
          }),
          itemCount: controller.personList.length,
          separatorBuilder: (context, index) {
            return const Divider(height: 20);
          },
        );
      }),
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
    var person = controller.personList[index];
    return Card(
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
                  person.personName,
                  style: const TextStyle(fontSize: 25),
                ),
                space5,
                Text(
                  'Amount :${person.personAmount}',
                  style: const TextStyle(fontSize: 20),
                ),
                space5,
                Text("last Added Task : ${person.listOfTask.last.taskName}"),
                space5,
                Text("EditedTime : ${person.listOfTask.last.editedTime}")
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
