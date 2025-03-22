import 'package:drift/drift.dart';
import 'package:keeper/src/person/model/person.dart';

@UseRowClass(Person, generateInsertable: true)
class PersonTbl extends Table {
  late final id = integer().nullable().autoIncrement()();
  late final name = text()();
  // late final phoneNumber = text().map(phoneNumberConverter).unique()();
  late final isoCode = text().nullable()();
  late final countryCode = text().nullable()();
  late final nsn = text().unique()();
  late final email = text().nullable()();
  late final password = text().nullable()();
  late final profileImage = blob().nullable()();
  late final amount = real().withDefault(Constant(0.0))();
  late final createdAt =
      dateTime().withDefault(currentDateAndTime).nullable()();
  late final updatedAt = dateTime().nullable()();
  late final about = text().nullable()();
  late final agreeToTerms = boolean().withDefault(Constant(false))();
}
