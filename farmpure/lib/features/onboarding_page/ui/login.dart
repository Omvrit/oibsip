import 'package:farmpure/backend_services/auth/auth.dart';
import 'package:farmpure/features/onboarding_page/ui/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../home_page/ui/home_page.dart';

class Login extends StatelessWidget {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 380, maxHeight: 300),
                  child: Image.asset('assets/onboarding.png', scale: .8),
                ),
                const SizedBox(height: 20),
                Text('Welcome to FarmPure',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    "Get your agriculture products from the comfort of your home. You're just a few clicks away from your favorite products.",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 20),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    try {
                      UserCredential userCredential =
                      await Auth.login(email, password);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(userCredential)));
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                ),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Login({super.key});
}