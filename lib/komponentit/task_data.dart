import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(
        name: 'Tehtävä 1',
        details: 'Ensimmäinen tehtävä',
        deadline: DateTime.now().add(Duration(days: 1)),
        isDone: false),
    Task(
        name: 'Tehtävä 2',
        details: 'Toinen tehtävä',
        deadline: DateTime.now().add(Duration(days: 3)),
        isDone: true),
    Task(
        name: 'Tehtävä 3',
        details: 'Kolmas tehtävä',
        deadline: DateTime.now().add(Duration(days: 5)),
        isDone: false),
  ];

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners(); // Notify listeners about the change
  }

  void editTask(int index, Task editedTask) {
    tasks[index] = editedTask;
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void toggleDone(int index) {
    tasks[index].toggleDone();
    notifyListeners();
  }
}
