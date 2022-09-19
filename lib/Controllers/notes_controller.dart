import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Model/notes.dart';


class NotesController extends GetxController {
  Box<Notes> noteBox =Hive.box<Notes>("Notes");

  addNotes(Notes newNotes) {
    noteBox.add(newNotes);
    update();
  }
  updateNotes(
   Notes notes,int index
  ){
    noteBox.putAt(index,notes);
    update();
  }
  deleteNote(int index){
    noteBox.deleteAt(index);
    update();
  }
}
