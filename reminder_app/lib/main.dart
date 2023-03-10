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
  bool _initialized = false;
  bool _error = false;

  initializeFirebase() async {
    try {
      await Firebase.initializeApp();

      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return const Center(
        child: Text('Une erreur de connection a eu lieu'),
      );
    }

    if (!_initialized) {
      return const Center(child: CircularProgressIndicator());
    }

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
}
