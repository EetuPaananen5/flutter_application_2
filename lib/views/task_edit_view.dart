import 'package:flutter/material.dart';
import 'package:flutter_application_2/komponentit/task.dart';

class TaskEditView extends StatefulWidget {
  final Task? task;

  TaskEditView(this.task);

  @override
  _TaskEditViewState createState() => _TaskEditViewState();
}

class _TaskEditViewState extends State<TaskEditView> {
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
        title: Text(widget.task == null ? 'Lisää tehtävä' : 'Muokkaa tehtävää'),
        actions: [
          if (widget.task != null)
            IconButton(
              icon: Icon(Icons.delete),
              iconSize: 50.0, // Aseta tässä haluamasi koko ikonille
              onPressed: () {
                final deletedTask = Task(
                    name: '',
                    details: '',
                    deadline: DateTime.now(),
                    isDone: false,
                    isDeleted: true);
                Navigator.pop(context, deletedTask);
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
              decoration: InputDecoration(labelText: 'Nimi'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Tarkenne'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('Deadline: '),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('Tehty'),
              value: _isDone,
              onChanged: (value) {
                setState(() {
                  _isDone = value ?? false;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final editedTask = Task(
                  name: _nameController.text,
                  details: _detailsController.text,
                  deadline: _selectedDate,
                  isDone: _isDone,
                  isDeleted: false,
                );

                Navigator.pop(context, editedTask);
              },
              child: Text('Tallenna'),
            ),
          ],
        ),
      ),
    );
  }
}