import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class PersonController extends GetxController {
  Box<Person> personBox = Hive.box<Person>("Person");
   Box<Person> deletedBox = Hive.box<Person>('DeletedBox');
  
  late Uint8List localImage;
  @override
  void onInit() async {
    localImage = await fileToUnit8List();
    super.onInit();
  }

  RxBool isDark = false.obs;

  File? selectedImage;
  Uint8List? imageAsByts;

  int get personBoxCount => personBox.length;

  RxInt taskAmountCount = 0.obs;
  int previousAmount=0;
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
        person.listOfTask.add(task);

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

  Future<Uint8List> fileToUnit8List() async {
    // var localFile = rootBundle.load('assets/1.png');
    // Unit8List byts = localFile.buffer.asUn
    final ByteData bytes = await rootBundle.load('assets/1.png');
    final Uint8List list = bytes.buffer.asUint8List();
    return localImage = list;
  }

  Future<Uint8List?> convertImageAsUnit8List(File? image) async {
    if (image != null) {
      imageAsByts = await selectedImage!.readAsBytes();
      return imageAsByts;
    } else {
      return null;
    }
  }

  Future pickImage(ImageSource source) async {
    try {
      final temparyImage = await ImagePicker().pickImage(source: source);
      if (temparyImage == null) return;
      selectedImage = File(temparyImage.path);
      imageAsByts = await convertImageAsUnit8List(selectedImage);
      update();
    } on PlatformException catch (e) {
      log("Anikuttan ==> Error from ImagePicker this is Error =>$e");
    }
    return null;
  }

  createPerson({required Person person}) async {
    await personBox.add(person);
    update();
  }

  Future<void> updatePerson({
    required int index,
    required Person person,
  }) async {
    log(person.personImage.toString());

    await personBox.putAt(index, person);
    person.save();
    update();
  }

  Future<void> deletePerson(
      {required int index, required Person? deletedPerson}) async {
    await personBox.deleteAt(index);
    await deletedBox.add(deletedPerson!);
    update();
  }
 deleteFromDeleteBox({required int index}) {
    deletedBox.deleteAt(index);
    update();
  }
 
}
