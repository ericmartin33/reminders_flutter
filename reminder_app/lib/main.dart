import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/models/todo_list/todo_list_collection.dart';
import 'package:reminder_app/screens/add_list/add_list_screen.dart';
import 'package:reminder_app/screens/add_reminder/add_reminder_screen.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
