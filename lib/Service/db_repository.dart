import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Model/person.dart';

class DbRepository {
  static const String dbName = 'Person';
  static openBox() async => await Hive.openBox<Person>(dbName);
  static Box<Person>  getBox() => Hive.box<Person>(dbName);
  static closeBox() async => await Hive.box(dbName).close();
}
