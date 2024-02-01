import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_2/models/task.dart';

class FirebaseHelper{
  final DatabaseReference _taskRef = FirebaseDatabase.instance.ref().child('tasks');

  void saveTask(Task task){
    _taskRef.push().set(task.toJson()); //Tallennetaan Task Jsonina
  }

  Future<List<Task>> getData() async{
   List<Task> tasks = [];

   DatabaseEvent event = await _taskRef.once();

   var snapshot = event.snapshot;

   for (var child in snapshot.children){
    Task task = Task.fromJson(child.value as Map<String, dynamic>);
    task.firebaseid = child.key;
    tasks.add(task);

   }
   return tasks;
  }
}