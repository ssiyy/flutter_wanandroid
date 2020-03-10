import 'package:flutter/material.dart';

class UserLoginPage extends StatefulWidget {
  @override
  UserLoginState createState() => UserLoginState();
}

class UserLoginState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Center(child: Image.asset("assets/images/logo.png")),
          TextField(),
          TextField(),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: RaisedButton(
              child: Text("登录"),
              onPressed: () {},
            ),
          )
        ]));
  }
}
