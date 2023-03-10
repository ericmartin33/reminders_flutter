import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.toggleView});

  final VoidCallback toggleView;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text('Sign Up'),
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 200,
        ),
        Text(
          'Une appli quelle est belle',
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ]),
    );
  }
}
