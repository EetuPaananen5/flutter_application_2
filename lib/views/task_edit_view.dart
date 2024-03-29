import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/task.dart';
import 'package:flutter_application_2/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskEditView extends StatefulWidget {
  final Task? task;

  const TaskEditView(this.task, {super.key});

  @override
  TaskEditViewState createState() => TaskEditViewState();
}

class TaskEditViewState extends State<TaskEditView> {
  late TextEditingController _nameController;
  late TextEditingController _detailsController;
  late DateTime _selectedDate;
  bool _isDone = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.task?.name ?? '');
    _detailsController =
        TextEditingController(text: widget.task?.details ?? '');
    _selectedDate = widget.task?.deadline ?? DateTime.now();
    _isDone = widget.task?.isDone ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Add Workout' : 'Edit Workout'),
        actions: [
          if (widget.task != null)
            IconButton(
              icon: const Icon(Icons.delete),
              iconSize: 50.0,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false) //poistaa tehtävän
                    .deleteTask(widget.task!);
                Navigator.pop(context);
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'What workout?'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(labelText: 'Moves and reps'),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('When: '),
                TextButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null && pickedDate != _selectedDate) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    "${_selectedDate.day}.${_selectedDate.month}.${_selectedDate.year}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              title: const Text('Check if done'),
              value: _isDone,
              onChanged: (value) {
                setState(() {
                  _isDone = value ?? false;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final editedTask = Task(
                  name: _nameController.text,
                  details: _detailsController.text,
                  deadline: _selectedDate,
                  isDone: _isDone,
                  isDeleted: false,
                );

                // Use the addTask method to save the task
                Provider.of<TaskData>(context, listen: false)
                    .addTask(editedTask);
                Navigator.pop(context, editedTask);
              },
              child: const Text('Save Workout'),

            ),
          ],
        ),
      ),
    );
  }
}
