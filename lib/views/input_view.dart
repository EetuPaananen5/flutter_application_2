import 'package:flutter/material.dart';
import 'package:flutter_application_2/komponentit/task.dart';
import 'package:flutter_application_2/views/task_edit_view.dart';

class  InputView extends StatefulWidget {
  const InputView({super.key});

  @override
  _InputViewState createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  List<Task> tasks = [
    Task(
      name: 'Tehtävä 1',
      details: 'Ensimmäinen tehtävä',
      deadline: DateTime.now().add(const Duration(days: 1)),
      isDone: false,
    ),
    Task(
      name: 'Tehtävä 2',
      details: 'Toinen tehtävä',
      deadline: DateTime.now().add(const Duration(days: 3)),
      isDone: true,
    ),
    Task(
      name: 'Tehtävä 3',
      details: 'Kolmas tehtävä',
      deadline: DateTime.now().add(const Duration(days: 5)),
      isDone: false,
    ),
  ];

  void _addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void _editTask(int index, Task editedTask) {
    setState(() {
      tasks[index] = editedTask;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _openEditView(Task task) async {
    final editedTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskEditView(task)),
    );

    if (editedTask != null) {
      if (editedTask.isDeleted) {
        _deleteTask(tasks.indexOf(task));
      } else {
        _editTask(tasks.indexOf(task), editedTask);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 50.0, // Aseta tässä haluamasi koko ikonille
            onPressed: () async {
              final newTask = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskEditView(null)),
              );

              if (newTask != null) {
                _addTask(newTask);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(tasks[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tasks[index].details),
                  Text('Deadline: ${tasks[index].formattedDeadline}'),
                ],
              ),
              trailing: IconButton(
                icon: tasks[index].isDone
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
                onPressed: () {
                  setState(() {
                    tasks[index].toggleDone();
                  });
                },
              ),
              onTap: () {
                _openEditView(tasks[index]);
              },
              onLongPress: () {
                _deleteTask(index);
              },
            ),
          );
        },
      ),
    );
  }
}
