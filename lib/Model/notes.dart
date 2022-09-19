import 'package:hive_flutter/adapters.dart';
part 'notes.g.dart';
@HiveType(typeId: 3)
class Notes {
  @HiveField(0)
  String title;
  @HiveField(1)
  String notes;
  Notes({
    required this.title,
    required this.notes,
  });
}
