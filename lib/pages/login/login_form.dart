import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/pages/login/bloc/login_bloc.dart';
import 'package:wanandroid/pages/login/bloc/login_state.dart';
import 'package:wanandroid/pages/login/login_repository.dart';
import 'package:wanandroid/pages/login/bloc/login_event.dart';
import 'package:wanandroid/pages/register/register_form.dart';
import 'package:wanandroid/pages/register/register_page.dart';
import 'package:wanandroid/util/slide_right_route.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  ///用户账号
  final _accoutController = TextEditingController();

  ///用户密码
  final _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              Scaffold.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      "${state.error}",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
            } else if (state is LoginLoading) {
              Scaffold.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
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
                  child: _AccoutField(accoutController: _accoutController),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: _PwdField(pwdController: _pwdController),
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
                )
              ],
            );
          }),
        ));
  }
}

class _AccoutField extends StatefulWidget {
  ///用户账号
  final TextEditingController _accoutController;

  _AccoutField({Key key, @required TextEditingController accoutController})
      : _accoutController = accoutController,
        super(key: key);

  @override
  _AccoutState createState() => _AccoutState();
}

class _AccoutState extends State<_AccoutField> {
  @override
  Widget build(BuildContext context) {
    //清除输入的东西
    final clearButClick = () {
      setState(() {
        widget._accoutController.clear();
      });
    };
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
          controller: widget._accoutController,
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
            onPressed: clearButClick)
      ],
    );
  }
}

class _PwdField extends StatefulWidget {
  ///用户账号
  final TextEditingController _pwdController;

  _PwdField({Key key, @required TextEditingController pwdController})
      : _pwdController = pwdController,
        super(key: key);

  @override
  _PwdState createState() => _PwdState();
}

class _PwdState extends State<_PwdField> {
  var showPwd = true;

  @override
  Widget build(BuildContext context) {
    //清楚输入的东西
    final changPwdButClick = () {
      setState(() {
        showPwd = !showPwd;
      });
    };

    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
          controller: widget._pwdController,
          obscureText: showPwd,
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
          onPressed: changPwdButClick,
        )
      ],
    );
  }
}
