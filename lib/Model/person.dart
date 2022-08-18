import 'task.dart';

class Person {
  String personName;
  int personAmount;
  List<Task> listOfTask;
  Person({
    required this.personName,
    required this.personAmount,
    this.listOfTask = const <Task>[],
  });
}
