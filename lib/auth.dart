import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getStatus(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
        return false;
      } else {
        return true;
      }
    });
  }

  // prihlaseni
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // registrace
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);

    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // odhlaseni
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}