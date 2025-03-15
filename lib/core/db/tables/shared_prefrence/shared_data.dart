import 'package:drift/drift.dart';

class SharedData extends Table {
  late final id = integer().autoIncrement()();
  late final isLogined = boolean()();
  late final personId = integer().nullable()();
}
