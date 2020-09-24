import 'package:flutter/material.dart';
import 'package:lock_app/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //TODO databzaze
  final username = "Honza";
  final password = "1234";

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
            Text("Username"),
            TextFormField(
              validator: (String value) {
                if (value != username) {
                  return 'Username incorrect';
                }
                return null;
              },
            ),
            Text("Password"),
            TextFormField(
              obscureText: true,
              validator: (String value) {
                if (value != password) {
                  return 'Password incorrect';
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Home()
                  ));
                }
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
