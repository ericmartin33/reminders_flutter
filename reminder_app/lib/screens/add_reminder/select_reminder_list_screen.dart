import 'package:flutter/material.dart';

import '../../models/todo_list/todo_list.dart';

class SelectReminderListScreen extends StatelessWidget {
  const SelectReminderListScreen(
      {super.key,
      required this.todoLists,
      required this.selectedTodoList,
      required this.selectListCallback});

  final List<TodoList> todoLists;
  final TodoList selectedTodoList;
  final Function(TodoList) selectListCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select List'),
      ),
      body: ListView.builder(
          itemCount: todoLists.length,
          itemBuilder: (context, index) {
            final item = todoLists[index];
            return ListTile(
                onTap: () {
                  selectListCallback(item);
                  Navigator.pop(context);
                },
                title: Text(item.title),
                trailing: item.title == selectedTodoList.title
                    ? Icon(Icons.check)
                    : null);
          }),
    );
  }
}
