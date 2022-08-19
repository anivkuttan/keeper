import 'package:get/get.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';

class PersonController extends GetxController {
  RxList<Person> personList = <Person>[
     Person(
      personName: "User1FromController",
      personAmount: 120,
      listOfTask: [
        Task(taskName: "Sambar", taskAmount: 40, editedTime: DateTime.now()),
      ],
    ),
     Person(
      personName: "User2FromController",
      personAmount: 10,
      listOfTask: [
        Task(taskName: "FishKari", taskAmount: 40, editedTime: DateTime.now()),
      ],
    ),
  ].obs;
}
