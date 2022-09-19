import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';
// import 'package:keeper/Model/task.dart';

class PersonController extends GetxController {
  Box<Person> personBox = Hive.box<Person>("Person");

  int get personBoxCount => personBox.length;

  RxInt taskAmountCount = 0.obs;
  RxBool sellectAllValue = false.obs;

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
      if (person.isSelected) {
        // log("before Adding new task $person");
        person.listOfTask.add(task);

        // log("after Adding new task $person");
        person.personAmount += taskAmountCount.value;
        ////save function only available when you extends hive Object in your class
        ///save mentod can save the editing or updating changes....
        person.save();
        update();
      } else {
        null;
      }
    }
  }

  createPerson({required Person person}) async {
    // log("befor adding person keys count ${personBox.keys}");
    // log("personbox Length ${personBox.length}");

    await personBox.add(person);

    // log("person list length ${personBox.length}");
    update();
    // log("afterAdding person key count ${personBox.keys}");
    // log('  personbox values => ${personBox.values}');
  }

  Future<void> deletePerson({required int index}) async {
    // log('delete function called');
    // log("personlist length befor deleting ${personBox.length}");
    await personBox.deleteAt(index);
    update();
    // log("personlist length after deleting ${personBox.length}");
    // log('delete sussefully');
  }

  Future<void> deleteAllPerson() async {
    // log('delete All function called');
    // log("personlist length befor deleting ${personBox.length}");
    await personBox.clear();
    update();
    // log("personlist length after deleting ${personBox.length}");
    // log('delete sussefully');
  }
}
