import 'dart:collection';
import '../../common/widgets/category_icon.dart';
import 'category.dart';
import 'package:flutter/material.dart';

class CategoryCollection {
  final List<Category> _categories = [
    Category(
      id: 'today',
      name: 'Today',
      icon: CategoryIcon(
        backgroundColor: Colors.cyan,
        iconData: Icons.calendar_today,
      ),
    ),
    Category(
      id: 'scheduled',
      name: 'Scheduled',
      icon: CategoryIcon(
        backgroundColor: Colors.red,
        iconData: Icons.calendar_month,
      ),
    ),
    Category(
      id: 'all',
      name: 'All',
      icon: CategoryIcon(
        backgroundColor: Colors.grey,
        iconData: Icons.inbox_rounded,
      ),
    ),
    Category(
      id: 'flagged',
      name: 'Flagged',
      icon: CategoryIcon(
        backgroundColor: Colors.orange,
        iconData: Icons.flag_sharp,
      ),
    )
  ];

  UnmodifiableListView<Category> get categories {
    return UnmodifiableListView(_categories);
  }

  Category removeItem(index) {
    Category itemRemoved = _categories.removeAt(index);
    return itemRemoved;
  }

  insertItem(index, category) {
    _categories.insert(index, category);
  }

  List<Category> get selectedCategories {
    return _categories.where((element) => element.isChecked).toList();
  }
}
