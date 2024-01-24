import 'package:flutter/material.dart';
import 'package:flutter_application_2/komponentit/task.dart';
import 'package:flutter_application_2/views/main_view.dart';
import 'package:flutter_application_2/views/task_edit_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/komponentit/task_data.dart';


class InputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tehtävät'),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainView()),
                );
              },
              child: Text('Go to Main View'),
            ),
          ),
        ],
      ),
      body: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(taskData.tasks[index].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(taskData.tasks[index].details),
                      Text(
                          'Deadline: ${taskData.tasks[index].formattedDeadline}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: taskData.tasks[index].isDone
                        ? Icon(Icons.check_box)
                        : Icon(Icons.check_box_outline_blank),
                    iconSize: 30.0,
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .toggleDone(index);
                    },
                  ),
                  onTap: () {
                    _openEditView(context, taskData.tasks[index]);
                  },
                  onLongPress: () {
                    Provider.of<TaskData>(context, listen: false)
                        .deleteTask(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _openEditView(BuildContext context, Task task) async {
    final editedTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskEditView(task)),
    );

    if (editedTask != null) {
      Provider.of<TaskData>(context, listen: false).editTask(
        Provider.of<TaskData>(context, listen: false).tasks.indexOf(task),
        editedTask,
      );
    }
  }
}
