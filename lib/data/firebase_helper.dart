import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_2/models/task.dart';

class FirebaseHelper {
  final DatabaseReference _taskRef = FirebaseDatabase.instance
      .ref()
      .child('tasks')
      .child(FirebaseAuth.instance.currentUser!
          .uid); //Tietokantareferenssi (tasks) ja käyttäjän uid (FirebaseAuth.instance.currentUser!.uid

  void saveTask(Task task) {
    var itemref = _taskRef.push();
    task.firebaseid = itemref.key;

    itemref.set(task.toJson()); //Tallennetaan Task Jsonina
  }

  void deleteTask(Task task) {
    if (task.firebaseid != null) {
      _taskRef.child(task.firebaseid.toString()).remove();
    }
  }

  void editTask(Task task) {
    if (task.firebaseid != null) {
      _taskRef.child(task.firebaseid.toString()).update(task.toJson());
    }
  }

  Future<List<Task>> getData() async {
    List<Task> tasks = [];

    DatabaseEvent event = await _taskRef.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      Task task = Task.fromJson(child.value as Map<String, dynamic>);
      task.firebaseid = child.key;
      tasks.add(task);
    }
    return tasks;
  }
}
