import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';

class DbRepository {
  static const String dbName = 'Person';
  static openPersonBox() async => await Hive.openBox<Person>(dbName);
  static openTaskbox() async => await Hive.openBox<Task>("Task");
  static Box<Person>  getBox() => Hive.box<Person>(dbName);
  static Box<Task>  getTaskBox() => Hive.box<Task>('Task');
  static closeBox() async => await Hive.box(dbName).close();
}
