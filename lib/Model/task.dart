class Task {
  String taskName;
  int taskAmount;
  DateTime? editedTime;
  Task({
    required this.taskName,
    required this.taskAmount,
    this.editedTime ,
  });
}
