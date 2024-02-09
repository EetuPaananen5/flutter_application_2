import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/task_data.dart';
import 'package:flutter_application_2/views/info_view.dart';
import 'package:flutter_application_2/views/input_view.dart';
import 'package:flutter_application_2/views/main_view.dart';
import 'package:flutter_application_2/views/training_programs_view.dart';
//import 'package:flutter_application_2/views/task_edit_view.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
    // You can handle the error here, for example by showing a message to the user
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp();

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromARGB(255, 222, 236, 248), // Change this to your desired color
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        title: 'Task Manager',

        initialRoute:
            FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
        routes: {
          '/sign-in': (context) {
            return SignInScreen(
              providers: providers,
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacementNamed(context, '/main-view');
                }),
              ],
            );
          },
          '/profile': (context) {
            return ProfileScreen(
              providers: providers,
              actions: [
                SignedOutAction((context) {
                  Navigator.pushReplacementNamed(context, '/sign-in');
                }),
              ],
            );
          },
          '/main-view': (context) {
            return const MainView();
          },
          // '/task_edit_view': (context) => const TaskEditView(), // Add this line
          '/input': (context) => const InputView(),
          '/info': (context) => const InfoView(),
          '/programs':(context) => const TrainingProgramView() // A
        },

        //home: InputView(),
      ),
    );
  }
}
