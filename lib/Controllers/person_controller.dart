import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';
// import 'package:keeper/Model/task.dart';
import 'package:keeper/Service/db_repository.dart';

class PersonController extends GetxController {
  Box<Person> personBox = DbRepository.getBox();
  int get personBoxCount => personBox.length;

  // addDefaultPerson() {
  //   Person defaultPerson = Person(
  //     personName: "HiveDefault",
  //     personAmount: 400,
  //     listOfTask: [
  //       Task(taskName: "LocalDatabase", taskAmount: 50, editedTime: "Hive DataBase"),
  //     ],
  //   );
  //   personBox.add(defaultPerson);
  //   log("default person added");
  // }

  RxInt taskAmountCount = 0.obs;
  RxBool sellectAllValue = false.obs;
  // List<Person> personList = <Person>[
  //   Person(
  //     personName: "User1FromController",
  //     personAmount: 100,
  //     listOfTask: [
  //       Task(taskName: "Sambar", taskAmount: 40, editedTime: ""),
  //     ],
  //   ),
  // ];
  void counterIncrment(String buttonName) {
    taskAmountCount.value += int.parse(buttonName);
  }

  void counterDecrement(String buttonName) {
    taskAmountCount.value -= int.parse(buttonName);
  }

  checkBoxValueChanged(int index) {
    Person? person = personBox.getAt(index);
    // personList[index].isSelected = !personList[index].isSelected;
    person!.isSelected = !person.isSelected;

    // checking every list person on checked or not if every one is checkd
    // master checkbox will check
    bool isallSelected = personBox.values.every(
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
    for (var person in personBox.values) {
      person.isSelected = masterCheckValue;
      update();
    }
  }

  addTaskToSomeOneFunction(Task task) {
    for (Person person in personBox.values) {
      log('add task function ${person.toString()}');

      if (person.isSelected) {
        person.listOfTask.add(task);
        person.personAmount += taskAmountCount.value;
        update();
      } else {
        null;
      }
    }
  }

  createPerson({required Person person}) async {
    log("befor adding person ${personBox.keys}");
    await personBox.add(person);
    log("personlist length ${personBox.length}");
    update();
    log("afterAdding person ${personBox.keys}");
    log('  personbox is empty => ${personBox.values}');
  }

  updatePerson({required Person newPerson, required int index}) {
    
    update();
  }

  Future<void> deletePerson({required int index}) async {
    log('delete function called');
    log("personlist length befor deleting ${personBox.length}");
    await personBox.deleteAt(index);
    update();
    log("personlist length after deleting ${personBox.length}");
    log('delete sussefully');
  }

  Future<void> deleteAllPerson() async {
    log('delete All function called');
    log("personlist length befor deleting ${personBox.length}");
    await personBox.clear();
    update();
    log("personlist length after deleting ${personBox.length}");
    log('delete sussefully');
  }
}
