import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Model/notes.dart';
import 'package:keeper/Model/person.dart';


class DbRepository {
  static const String dbName = 'Person';
  static openPersonBox() async => await Hive.openBox<Person>(dbName);
  static openNotesbox() async => await Hive.openBox<Notes>("Notes");
  
  static Box<Person> getPersonBox() => Hive.box<Person>(dbName);
  static Box<Notes> getNotesBox() => Hive.box<Notes>('Notes');
  static closeBox() async => await Hive.box(dbName).close();
}
