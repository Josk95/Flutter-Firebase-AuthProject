import 'package:firebase_auth_app/services/auth.dart';
import 'package:firebase_auth_app/shared/constant.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text Field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          centerTitle: true,
          title: const Text('Sign in'),
          actions: [
            TextButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: const Text(
                  'Register',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration
                      .copyWith(labelText: 'Email')
                      .copyWith(icon: const Icon(Icons.email)),
                  validator: (value) => value!.isEmpty ? 'Enter email' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration
                      .copyWith(labelText: 'Password')
                      .copyWith(icon: const Icon(Icons.lock)),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter password' : null,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result =
                            await _authService.signInWithEmail(email, password);

                        if (result == null) {
                          setState(() => error = 'Wrong credentials');
                        }
                      }
                    },
                    child: const Text('Sign in')),
                const SizedBox(height: 20),
                Text(error,
                    style: const TextStyle(color: Colors.red, fontSize: 14)),
              ],
            ),
          ),
        ));
  }
}
