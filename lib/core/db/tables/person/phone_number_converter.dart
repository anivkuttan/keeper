// class PhoneNumberConverter extends TypeConverter<PhoneNumber, String> {
//   @override
//   PhoneNumber fromSql(String fromDb) {
//     return PhoneNumber.fromJson(jsonDecode(fromDb));
//   }

//   @override
//   String toSql(PhoneNumber phoneNumber) {
//     return jsonEncode(phoneNumber.toJson());
//   }
// }

// final phoneNumberConverter = TypeConverter.json2(
//   fromJson: (json) => PhoneNumber.fromJson(json as Map<String, Object?>),
//   toJson: (phone) => phone.toJson(),
// );
