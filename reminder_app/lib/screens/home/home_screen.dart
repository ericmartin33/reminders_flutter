import 'package:flutter/material.dart';

import 'package:reminder_app/screens/home/widgets/list_view_items.dart';

import '../../models/category/category_collection.dart';

import 'widgets/footer.dart';
import 'widgets/grid_view_items.dart';
import 'widgets/todo_lists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layoutType = 'grid';
  CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: [
          TextButton(
            onPressed: () {
              if (layoutType == 'grid') {
                setState(() {
                  layoutType = 'list';
                });
              } else {
                setState(() {
                  layoutType = 'grid';
                });
              }
            },
            child: Text(
              layoutType == 'grid' ? 'Edit' : 'Done',
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: layoutType == 'grid'
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: GridViewItems(
                      categories: categoryCollection.selectedCategories),
                  secondChild:
                      ListViewItems(categoryCollection: categoryCollection),
                ),
                TodoLists(),
              ],
            ),
          ),
          const Footer()
        ],
      ),
    );
  }
}
