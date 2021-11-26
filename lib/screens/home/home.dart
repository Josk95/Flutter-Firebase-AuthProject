import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              onPressed: () {},
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
