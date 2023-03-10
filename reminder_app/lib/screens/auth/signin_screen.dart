import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.toggleView});

  final VoidCallback toggleView;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 200,
          ),
          Text(
            'Une appli quelle est belle',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Enter Email'),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) =>
                            value == null || !value.contains('@')
                                ? 'L\'email n\'est pas valide'
                                : null),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: _passwordController,
                        decoration:
                            const InputDecoration(hintText: 'Enter Password'),
                        obscureText: true,
                        validator: (value) => value!.length < 6
                            ? 'Le mot de passe doit faire au moins 6 caracteres'
                            : null),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('submit form');
                          }
                        },
                        child: const Text('Sign In'))
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
