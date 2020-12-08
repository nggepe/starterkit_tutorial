import 'package:flutter/material.dart';
import 'package:starterkit_tutorial/pages/setting.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ));
          },
          child: Text("Setting Theme"),
        ),
      )),
    );
  }
}
