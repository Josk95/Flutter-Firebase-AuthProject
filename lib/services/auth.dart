import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Instance of Firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in Anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in Email

  //Register with email

  //Sign Out

}
