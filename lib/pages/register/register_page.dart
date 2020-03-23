import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/pages/login/login_form.dart';
import 'package:wanandroid/pages/register/register_form.dart';

///
///   账号：flutter_user
///   密码：flutter
class RegisterPage extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //点击除了Editext之外的地方隐藏软键盘
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Builder(
                builder: (context) => SafeArea(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () => Navigator.pop(context)),
                          Container(
                              margin: EdgeInsets.only(left:20,right:20,bottom: 20),
                              child: Text(
                                "账号注册：",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              )),
                          RegisterForm()
                        ])))));
  }
}
