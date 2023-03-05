import 'package:flutter/material.dart';
import 'package:reminder_app/screens/add_list/add_list_screen.dart';
import 'package:reminder_app/screens/add_reminder/add_reminder_screen.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddReminderScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
            icon: const Icon(Icons.add_circle),
            label: const Text('New Reminder'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddListScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Text('Add List'),
          ),
        ],
      ),
    );
  }
}
