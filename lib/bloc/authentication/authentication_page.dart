import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/bloc/authentication/bloc.dart';
import 'package:wanandroid/util/transparent_route.dart';

class AuthenticationPage extends StatefulWidget {
  /// 验证用户是否登录
  ///
  /// true 登录
  ///
  /// false 没有
  static Future<bool> verification(BuildContext context) {
    return Navigator.push<bool>(
        context, TransparentRoute(builder: (context) => AuthenticationPage()));
  }

  @override
  AuthenticationPageState createState() => AuthenticationPageState();
}

class AuthenticationPageState<AuthenticationPage> extends State {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _authenticationBloc.add(AuthenticationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.isAuthenticated) {
          Navigator.pop(context, true);
        } else if (state.hasFailed) {
          Navigator.pop(context, false);
        }
        return Container();
      },
    );
  }
}
