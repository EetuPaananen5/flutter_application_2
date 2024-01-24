import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/info_view.dart';
import 'package:flutter_application_2/views/input_view.dart';
import 'package:flutter_application_2/views/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainView(),
        '/input': (context) => InputView(),
        '/info': (context) => InfoView(),
      },
    );
  }
}
