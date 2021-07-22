import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example_app/main.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtsurName = TextEditingController();
  TextEditingController txtAge = TextEditingController();

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(txtName.text);
    await prefs.setString("UserName", txtName.text);
    await prefs.setInt("UserAge", int.parse(txtAge.text));
    await prefs.setString("UserSurname", txtsurName.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("User Name: "),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: txtName,
                decoration:
                    InputDecoration(hintText: "User name..."),
              ),
            ),
            Text("User Surname: "),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: txtsurName,
                decoration:
                    InputDecoration(hintText: "User surname..."),
              ),
            ),
            Text("User age: "),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: txtAge,
                decoration:
                    InputDecoration(hintText: "User age..."),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _saveData().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                });
              },
              child: Text(
                "Save Data",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
