import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/common/widgets/category_icon.dart';
import 'package:reminder_app/screens/add_reminder/select_reminder_list_screen.dart';

import '../../models/todo_list/todo_list.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({super.key});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final TextEditingController _notesTextController = TextEditingController();
  final TextEditingController _titleTextController = TextEditingController();
  String _title = '';
  String _notes = '';
  TodoList? selectedList;
  @override
  void initState() {
    super.initState();

    _titleTextController.addListener(() {
      setState(() {
        _title = _titleTextController.text;
      });
    });
    _notesTextController.addListener(() {
      setState(() {
        _notes = _notesTextController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleTextController.dispose();
    _notesTextController.dispose();
  }

  updateSelectedList(TodoList todoList) {
    setState(() {
      selectedList = todoList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TodoList> todoLists = Provider.of<List<TodoList>>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Reminder'),
        actions: [
          TextButton(
            onPressed: _title.isEmpty
                ? null
                : () {
                    print('add to database');
                  },
            child: const Text(
              'Add',
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).cardColor),
              child: Column(
                children: [
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _titleTextController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Title'),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 100,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _notesTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Notes',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: ListTile(
                  tileColor: Theme.of(context).cardColor,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectReminderListScreen(
                            todoLists: todoLists,
                            selectListCallback: updateSelectedList,
                            selectedTodoList: selectedList ?? todoLists.first),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  leading: Text(
                    'List',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                          backgroundColor: Colors.blueAccent,
                          iconData: Icons.calendar_today),
                      const SizedBox(width: 10),
                      Text(selectedList != null
                          ? selectedList!.title
                          : todoLists.first.title),
                      const Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: ListTile(
                  tileColor: Theme.of(context).cardColor,
                  onTap: () {},
                  leading: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                          backgroundColor: Colors.blueAccent,
                          iconData: Icons.calendar_today),
                      const SizedBox(width: 10),
                      Text('Select Category'),
                      const Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
