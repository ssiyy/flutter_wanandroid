import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/pages/login/bloc/login_bloc.dart';
import 'package:wanandroid/pages/login/bloc/login_state.dart';
import 'package:wanandroid/pages/login/login_repository.dart';
import 'package:wanandroid/pages/login/bloc/login_event.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  ///用户账号
  TextEditingController _accoutController = TextEditingController();

  ///用户密码
  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              Scaffold.of(context).removeCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${state.error}",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is LoginLoading) {
              Scaffold.of(context).removeCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "登录中",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                      CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    ],
                  ),
                  backgroundColor: Colors.blue,
                ),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            final _loginButPressed = () {
              BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
                  username: _accoutController.text,
                  password: _pwdController.text));
            };

            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      TextField(
                        controller: _accoutController,
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
                      IconButton(
                          icon: Icon(Icons.highlight_off),
                          color: Colors.grey,
                          onPressed: () {
                            //隐藏键盘
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          })
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      TextField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                            labelText: "密码",
                            prefixIcon: Icon(Icons.lock),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            )),
                      ),
                      IconButton(
                        icon: Icon(Icons.visibility),
                        color: Colors.grey,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(
                              color: Color.fromARGB(225, 28, 90, 137))),
                      color: Color.fromARGB(225, 28, 90, 137),
                      child: Text(
                        "登录",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        if (state is! LoginLoading) {
                          _loginButPressed();
                        }
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "没有账号，去注册",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ),
                )
              ],
            );
          }),
        ));
  }
}
