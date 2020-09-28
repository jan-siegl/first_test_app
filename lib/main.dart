import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lock_app/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_error) {
      return MaterialApp(
        home: Text("error"),
      );
    }
    if (!_initialized) {
      return MaterialApp(
        home: Text("loading"),
      );
    }

    return MaterialApp(
      title: 'Lock app test',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Login(),
    );
  }
}
