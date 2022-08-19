import 'package:get/get.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';

class PersonController extends GetxController {
  RxInt taskAmountCount = 0.obs;
  RxList<Person> personList = <Person>[
    Person(
      personName: "User1FromController",
      personAmount: 100,
      listOfTask: [
        Task(taskName: "Sambar", taskAmount: 40, editedTime: DateTime.now()),
      ],
    ),
    Person(
      personName: "User2FromController",
      personAmount: 200,
      listOfTask: [
        Task(taskName: "FishKari", taskAmount: 40, editedTime: DateTime.now()),
      ],
    ),
  ].obs;
  void counterIncrment(String buttonName) {
    
      taskAmountCount.value += int.parse(buttonName);
   
  }

  void counterDecrement(String buttonName) {
       taskAmountCount.value -= int.parse(buttonName);
  }
}
