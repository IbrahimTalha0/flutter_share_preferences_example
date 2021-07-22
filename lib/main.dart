// @dart=2.9

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example_app/screens/verifiedPage.dart';

import 'screens/addUser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name;
  int age;
  String surName;
  bool login = false;

  @override
  void initState() {
    getData().then((value) {
      if (name == null || age == null || surName == null) {
      } else {
        setState(() {
          login = true;
        });
      }
    });
    super.initState();
  }

  Future getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("UserName");
      age = preferences.getInt("UserAge");
      surName = preferences.getString("UserSurname");
    });
  }

  @override
  Widget build(BuildContext context) {
    return login ? VerifiedPage() : AddUser();
  }
}
