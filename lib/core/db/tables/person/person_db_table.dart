import 'package:drift/drift.dart';
import 'package:keeper/src/person/model/person.dart';

@UseRowClass(Person, generateInsertable: true)
class PersonTbl extends Table {
  late final id = integer().nullable().autoIncrement()();
  late final name = text()();
  late final contactNumber = text()();
  late final email = text().nullable()();
  late final imageUrl = blob().nullable()();
  late final owedAmount = real()();
  late final createdAt = dateTime().nullable()();
  late final updatedAt = dateTime().nullable()();
}
