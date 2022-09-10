// import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
part 'task.g.dart';

@HiveType(typeId: 2)
class Task extends Equatable {
  @HiveField(0)
  final String taskName;
  @HiveField(1)
 final int taskAmount;
  @HiveField(2)
  final String? editedTime;

  const Task({
    required this.taskName,
    required this.taskAmount,
    this.editedTime,
  });
  @override
bool get stringify => true;
  @override
  List<Object?> get props => [taskName,taskAmount,editedTime];
  
}
