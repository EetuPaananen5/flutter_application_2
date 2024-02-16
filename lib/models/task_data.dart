import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/data/firebase_helper.dart';
import 'task.dart';

// Tämä on sama kuin Tommin todo_list_manager.dart
// Sisältää tehtävälistan hallinnan esim lisäys poisto jne.

class TaskData extends ChangeNotifier {
  final List<Task> tasks = [];
  final fbHelper = FirebaseHelper();
  /* Task(
        name: 'Tehtävä 1',
        details: 'Ensimmäinen tehtävä',
        deadline: DateTime.now().add(const Duration(days: 1)),
        isDone: false),
    Task(
        name: 'Tehtävä 2',
        details: 'Toinen tehtävä',
        deadline: DateTime.now().add(const Duration(days: 3)),
        isDone: true),
    Task(
        name: 'Tehtävä 3',
        details: 'Kolmas tehtävä',
        deadline: DateTime.now().add(const Duration(days: 5)),
        isDone: false),
  ];*/

  Future<void> init() async {
    loadFromFirebase();
  }

  void addTask(Task newTask) async { //Lisää tehtävä
    tasks.add(newTask);
    fbHelper.saveTask(newTask);
    notifyListeners(); // Notify listeners about the change
  }

  void editTask(int index, Task editedTask) { //Muokkaa tehtävää
    tasks[index] = editedTask;
    fbHelper.editTask(editedTask);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task); // This removes the task from the local list
    fbHelper.deleteTask(task); // This deletes the task from Firebase
    notifyListeners(); // This notifies the listeners about the change
  }

  void toggleDone(int index) {
    tasks[index].toggleDone();
    notifyListeners();
  }

  void loadFromFirebase() async {
    final list = await fbHelper.getData();
    for (Task task in list) {
      tasks.add(task);
    }
    notifyListeners();
  }
}
