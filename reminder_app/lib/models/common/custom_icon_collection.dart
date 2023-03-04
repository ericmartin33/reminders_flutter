import 'dart:collection';

import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomIconCollection {
  final List<CustomIcon> _icons = [
    CustomIcon(icon: Icons.monitor_heart_sharp, id: 'bar'),
    CustomIcon(icon: Icons.alarm, id: 'alarm'),
    CustomIcon(icon: Icons.airplanemode_active, id: 'airplane'),
    CustomIcon(icon: Icons.calendar_today, id: 'calendar'),
    CustomIcon(icon: Icons.payments_sharp, id: 'pay'),
    CustomIcon(icon: Icons.person, id: 'person'),
  ];

  UnmodifiableListView<CustomIcon> get icons =>
      UnmodifiableListView<CustomIcon>(_icons);

  CustomIcon findColorById(id) {
    return _icons.firstWhere((element) => element.id == id);
  }
}
