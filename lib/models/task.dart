//Tämä on sama kuin Tommin todo_item.dart
//Sisältää tuon kortti luokan määritteet

class Task {
  String name;
  String details;
  DateTime deadline;
  bool isDone;
  bool isDeleted; // Lisätty isDeleted-kenttä
  String? firebaseid; // Lisätty id-kenttä

  Task(
      {required this.name,
      required this.details,
      required this.deadline,
      required this.isDone,
      this.isDeleted = false,
      this.firebaseid});

  String get formattedDeadline {
    return "${deadline.day}.${deadline.month}.${deadline.year}";
  }

  void toggleDone() {
    isDone = !isDone;
  }

  //FromJSON ja toJSON -metodit, joilla muunnetaan Task-olio JSON-muotoon ja takaisin
  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        details = json['details'] as String,
        deadline = DateTime.parse(json['deadline'] as String),
        isDone = json['isDone'] as bool,
        isDeleted = json['isDeleted'],
        firebaseid = json['id'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'details': details,
        'deadline': deadline.toIso8601String(),
        'isDone': isDone,
        'isDeleted': isDeleted,
        'id': firebaseid,
      };
}
