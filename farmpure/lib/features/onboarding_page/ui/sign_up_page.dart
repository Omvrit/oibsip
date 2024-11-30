// File: lib/features/onboarding_page/ui/sign_up_page.dart

import 'package:farmpure/features/onboarding_page/ui/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../backend_services/auth/auth.dart';
import '../../home_page/ui/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 380, maxHeight: 100),
                  child: Image.asset('assets/onboarding.png'),
                ),
            
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your password',
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                ),
                //username
                //phone number
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                  onChanged: (value) {
                    username = value;
                  },
                ),
            
                const SizedBox(height: 20),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    UserCredential userCredential =
                        await Auth.register(email, password, username);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(userCredential)));
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text("Sign Up"),
                ),
                const SizedBox(height: 20),
                const Text("Already have an account? "),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  Login()));
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
