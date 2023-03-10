import 'dart:collection';
import 'package:flutter/material.dart';

import 'todo_list.dart';

class TodoListCollection with ChangeNotifier {
  final List<TodoList> _todoLists = [];

  UnmodifiableListView<TodoList> get todoList =>
      UnmodifiableListView(_todoLists);

  addTodoList(TodoList list) {
    _todoLists.add(list);
    notifyListeners();
  }

  removeTodoList(TodoList list) {
    _todoLists.removeWhere((element) => element.id == list.id);
    notifyListeners();
  }
}
