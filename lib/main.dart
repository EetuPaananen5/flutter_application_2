import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/info_view.dart';
import 'package:flutter_application_2/views/input_view.dart';
import 'package:flutter_application_2/views/main_view.dart';
import 'package:flutter_application_2/views/task_edit_view.dart';
import 'package:flutter_application_2/komponentit/task.dart';
import 'package:flutter_application_2/komponentit/task_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'Task Manager',
        home: InputView(),
      ),
    );
  }
}
