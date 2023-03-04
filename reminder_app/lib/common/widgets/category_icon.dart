import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final dynamic backgroundColor;
  final IconData iconData;

  CategoryIcon({required this.backgroundColor, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: 30,
      ),
    );
  }
}
