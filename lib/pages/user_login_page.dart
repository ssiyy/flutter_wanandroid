import 'package:flutter/material.dart';
import 'package:wanandroid/util/util.dart';

///
///   账号：flutter_user
///   密码：flutter
class UserLoginPage extends StatefulWidget {
  @override
  UserLoginState createState() => UserLoginState();
}

class UserLoginState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            body: Builder(
                builder: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Center(
                                child: Image.asset("assets/images/logo.png")),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: "账号",
                                prefixIcon: Icon(Icons.account_box),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                      labelText: "密码",
                                      prefixIcon: Icon(Icons.lock),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.cyan),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      )),
                                ),
                                IconButton(
                                  icon: Icon(Icons.visibility),
                                  onPressed: () {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    Util.showSnackBar(context, "fffff");
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            width: double.infinity,
                            child: RaisedButton(
                              child: Text("登录"),
                              onPressed: () {},
                            ),
                          )
                        ]))));
  }
}
