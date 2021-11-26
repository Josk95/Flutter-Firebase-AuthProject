import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: const Text('Sign in'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: ElevatedButton(
              onPressed: () async {
                dynamic result = await _authService.signInAnon();
                if (result == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                  print(result.uid);
                }
              },
              child: const Text('Sign In Anonymously'))),
    );
  }
}
