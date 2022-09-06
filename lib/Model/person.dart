import 'package:flutter/material.dart';

import 'task.dart';

class Person {
  Image? personImage;
  String personName;
  int personAmount;
  List<Task> listOfTask;
  bool isSelected;
  Person({
    required this.personName,
    required this.personAmount,
    this.personImage,
    this.listOfTask = const <Task>[],
    this.isSelected = false,
  });
}
