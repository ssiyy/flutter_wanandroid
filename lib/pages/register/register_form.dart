import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/pages/register/bloc/bloc.dart';
import 'package:wanandroid/pages/register/register_repository.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  ///用户账号
  final _accoutController = TextEditingController();

  ///用户密码
  final _pwdController = TextEditingController();

  ///用户确认密码
  final _rePwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            RegisterBloc(registerRepository: RegisterRepository()),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
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
            } else if (state is RegisterLoading) {
              Scaffold.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "注册中",
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
          child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
            final _registerButPressed = () {
              BlocProvider.of<RegisterBloc>(context).add(RegisterButtonPressed(
                  username: _accoutController.text,
                  password: _pwdController.text,
                  rePassword: _rePwdController.text));
            };

            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: _AccoutField(accoutController: _accoutController),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: _PwdField(
                    pwdController: _pwdController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: _PwdField(
                    pwdController: _rePwdController,
                    hintTxt: "确认密码",
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
                        "注册",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        if (state is! RegisterLoading) {
                          _registerButPressed();
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

  ///文本提示文字
  final String _hintTxt;

  _PwdField(
      {Key key, @required TextEditingController pwdController, String hintTxt})
      : _pwdController = pwdController,
        _hintTxt = hintTxt,
        super(key: key);

  @override
  _PwdState createState() => _PwdState();
}

class _PwdState extends State<_PwdField> {
  var showPwd = true;

  @override
  Widget build(BuildContext context) {
    //清除输入的东西
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
              hintText: widget._hintTxt,
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
