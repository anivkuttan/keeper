import 'package:hive_flutter/adapters.dart';
part 'task.g.dart';

@HiveType(typeId: 2)
class Task {
  @HiveField(0)
  String taskName;
  @HiveField(1)
  int taskAmount;
  @HiveField(2)
  String? editedTime;

  Task({
    required this.taskName,
    required this.taskAmount,
    this.editedTime,
  });
}
