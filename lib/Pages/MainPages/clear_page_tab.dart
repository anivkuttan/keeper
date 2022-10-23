import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:keeper/Controllers/person_controller.dart';

import '../../Controllers/deleted_controller.dart';

class ClearPageTabView extends StatefulWidget {
  const ClearPageTabView({Key? key}) : super(key: key);

  @override
  State<ClearPageTabView> createState() => _ClearPageTabViewState();
}

class _ClearPageTabViewState extends State<ClearPageTabView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PersonController>(builder: (controller) {
        return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
          return const ListTile(
            title: Text("hjk"),
          );
        });
      }),
    );
  }
}
