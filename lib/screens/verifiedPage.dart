import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({ Key key }) : super(key: key);

  @override
  _VerifiedPageState createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Verified"),actions: [IconButton(onPressed: ()async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.clear();
       Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
    }, icon: Icon(Icons.delete))],),
    body: Center(child: Text("Verified"),)
    );
  }
}