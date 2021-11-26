import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();

  //Text Field state
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          centerTitle: true,
          title: const Text('Register'),
          actions: [
            TextButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      _authService.registerWithEmail(email, password);
                    },
                    child: Text('Register'))
              ],
            ),
          ),
        ));
  }
}