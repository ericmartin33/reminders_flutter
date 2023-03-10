import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/models/todo_list/todo_list_collection.dart';
import 'package:reminder_app/screens/add_list/add_list_screen.dart';
import 'package:reminder_app/screens/add_reminder/add_reminder_screen.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Une erreur est survenue !'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider<TodoListCollection>(
            create: (BuildContext context) => TodoListCollection(),
            child: MaterialApp(
              title: 'Reminders',
              initialRoute: '/',
              routes: {
                '/': (context) => const HomeScreen(),
                '/addList': (context) => const AddListScreen(),
                '/addReminder': (context) => const AddReminderScreen(),
              },
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: const AppBarTheme(color: Colors.black),
                brightness: Brightness.dark,
                iconTheme: const IconThemeData(color: Colors.white),
                accentColor: Colors.white,
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueAccent,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                dividerColor: Colors.grey[600],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
