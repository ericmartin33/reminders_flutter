import 'package:flutter/material.dart';
import 'package:reminder_app/models/common/custom_color.dart';
import 'package:reminder_app/models/common/custom_color_collection.dart';
import 'package:reminder_app/models/common/custom_icon_collection.dart';

import '../../models/common/custom_icon.dart';

class AddListScreen extends StatefulWidget {
  const AddListScreen({super.key});

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  CustomColor _selectedColor = CustomColorCollection().colors.first;
  CustomIcon _selectedIcon = CustomIconCollection().icons.first;
  final TextEditingController _textController = TextEditingController();
  String _listName = '';

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _listName = _textController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('New List'),
        actions: [
          TextButton(
            onPressed: _listName.isEmpty
                ? null
                : () {
                    if (_listName.isNotEmpty) {
                      print('add to database');
                    } else {
                      print('no text');
                    }
                  },
            child: const Text(
              'Add',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedColor.color,
              ),
              child: Icon(_selectedIcon.icon, size: 75),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _textController,
                autofocus: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Icon(
                        Icons.clear,
                      ),
                    ),
                    onPressed: () {
                      _textController.clear();
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final customColor in CustomColorCollection().colors)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = customColor;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: customColor.color,
                        border: _selectedColor.id == customColor.id
                            ? Border.all(color: Colors.grey[300]!, width: 5)
                            : null,
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final customIcon in CustomIconCollection().icons)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = customIcon;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: _selectedIcon.id == customIcon.id
                              ? Border.all(color: Colors.grey[300]!, width: 5)
                              : null,
                          shape: BoxShape.circle,
                          color: Theme.of(context).cardColor),
                      child: Icon(customIcon.icon),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
