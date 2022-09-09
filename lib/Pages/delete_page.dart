import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Pages/home_page_tab.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete A Person'),
      ),
      body: Center(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.pink,
      alignment: Alignment.center,
      child: GetBuilder<PersonController>(
        builder: (controller) {
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
        },
      ),
    ),
      ),
    );
  }
}
