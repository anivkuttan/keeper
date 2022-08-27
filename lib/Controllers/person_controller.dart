import 'package:get/get.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';

class PersonController extends GetxController {
  RxInt taskAmountCount = 0.obs;
  RxBool sellectAllValue = false.obs;
  RxList<Person> personList = <Person>[
    Person(
      personName: "User1FromController",
      personAmount: 100,
      listOfTask: [
        Task(taskName: "Sambar", taskAmount: 40, editedTime: ""),
      ],
    ),
    Person(
      personName: "User2FromController",
      personAmount: 200,
      listOfTask: [
        Task(taskName: "FishKari", taskAmount: 40, editedTime: ''),
      ],
    ),
  ].obs;
  void counterIncrment(String buttonName) {
    taskAmountCount.value += int.parse(buttonName);
  }

  void counterDecrement(String buttonName) {
    taskAmountCount.value -= int.parse(buttonName);
  }

  checkBoxValueChanged(int index) {
    personList[index].isSelected = !personList[index].isSelected;
    // checking every list person on checked or not if every one is checkd
    // master checkbox will check
    bool isallSelected = personList.every(
      (element) => element.isSelected == true,
    );
    // print("Aikuttan $isallSelected");
    // checking one of the list item is unchecked master check box should be un_checked
    if (!isallSelected) {
      sellectAllValue.value = false;
    } else if (isallSelected) {
      sellectAllValue.value = true;
    }
    update();
  }

  masterCheckBoxValueChanged(bool masterCheckValue) {
    for (var person in personList) {
      person.isSelected = masterCheckValue;
      update();
    }
  }
}
