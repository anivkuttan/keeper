import 'package:drift/drift.dart';

class PersonTbl extends Table {
  late final name = text()();
  late final contactNumber = text()();
  late final email = text().nullable()();
  late final imageUrl = blob().nullable()();
  late final owedAmount = real()();
}
