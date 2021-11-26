import 'package:firebase_auth_app/screens/authenticate/authenticate.dart';
import 'package:firebase_auth_app/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Return Home or Auth widget based on Users Auth state.
    return Authenticate();
  }
}
