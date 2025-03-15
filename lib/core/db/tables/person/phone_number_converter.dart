import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:phone_form_field/phone_form_field.dart' show PhoneNumber;

class PhoneNumberConverter extends TypeConverter<PhoneNumber, String> {
  @override
  PhoneNumber fromSql(String fromDb) {
    return PhoneNumber.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(PhoneNumber phoneNumber) {
    return jsonEncode(phoneNumber.toJson());
  }
}
