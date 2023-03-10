import 'package:flutter/material.dart';

import '../../../models/category/category_collection.dart';

const LIST_VIEW_HEIGHT = 70.0;

class ListViewItems extends StatefulWidget {
  const ListViewItems({
    super.key,
    required this.categoryCollection,
  });

  final CategoryCollection categoryCollection;

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: widget.categoryCollection.categories.length * LIST_VIEW_HEIGHT +
            LIST_VIEW_HEIGHT,
        child: ReorderableListView(
          key: UniqueKey(),
          physics: const NeverScrollableScrollPhysics(),
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = widget.categoryCollection.removeItem(oldIndex);
            setState(() {
              widget.categoryCollection.insertItem(newIndex, item);
            });
          },
          children: widget.categoryCollection.categories
              .map(
                (category) => SizedBox(
                  height: LIST_VIEW_HEIGHT,
                  key: UniqueKey(),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        category.toggleCheckBox();
                      });
                    },
                    tileColor: Colors.grey[800],
                    leading: Container(
                        decoration: BoxDecoration(
                          color: category.isChecked
                              ? Colors.blueAccent
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: category.isChecked
                                  ? Colors.blueAccent
                                  : Colors.grey),
                        ),
                        child: Icon(Icons.check,
                            color: category.isChecked
                                ? Colors.white
                                : Colors.transparent)),
                    title: Row(
                      children: [
                        category.icon,
                        const SizedBox(width: 10),
                        Text(category.name),
                      ],
                    ),
                    trailing: const Icon(Icons.reorder),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
