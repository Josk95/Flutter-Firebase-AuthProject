import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        elevation: 0.0,
        title: Text('Welcome user'),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: Text(
                'Sign Out',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
