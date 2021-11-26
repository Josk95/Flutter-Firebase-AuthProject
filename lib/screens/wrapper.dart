import 'package:firebase_auth_app/models/user.dart';
import 'package:firebase_auth_app/screens/authenticate/authenticate.dart';
import 'package:firebase_auth_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    //Return Home or Auth widget based on Users Auth state.
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
