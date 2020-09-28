import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String email = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text("Email"),
            TextFormField(
              controller: _emailController,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Email nemuze byt prazdny';
                  //TODO kontrola emailu
                }
                return null;
              },
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            Text("Password"),
            TextFormField(
              controller: _passController,
              obscureText: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Heslo je nutne pro prihlaseni';
                  //TODO min 6 znaku
                }
                return null;
              },
              onChanged: (val) {
                setState(() => pass = val);
              },
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
                  //TODO error handling a upozorneni
                }
              },
              child: Text("Prihlasit se"),
            ),
            RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
                  //TODO error handling a upozorneni
                }
              },
              child: Text("Registrovat"),
            )
          ],
        ),
      ),
    );
  }

}