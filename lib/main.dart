import 'package:flutter/material.dart';
import 'package:flutter_application_2/komponentit/task_data.dart';
import 'package:flutter_application_2/views/input_view.dart';
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
      child:  MaterialApp(
        title: 'Task Manager',

initialRoute:
            FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/main-view',
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
            return const InputView();
          },
        },

        //home: InputView(),
      ),
    );
  }
}
