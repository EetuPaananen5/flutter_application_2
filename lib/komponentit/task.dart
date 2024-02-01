class Task {
  String name;
  String details;
  DateTime deadline;
  bool isDone;
  bool isDeleted; // Lisätty isDeleted-kenttä

  Task(
      {required this.name,
      required this.details,
      required this.deadline,
      required this.isDone,
      this.isDeleted = false});

  String get formattedDeadline {
    return "${deadline.day}.${deadline.month}.${deadline.year}";
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
