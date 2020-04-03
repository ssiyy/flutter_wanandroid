import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/pages/authentication/bloc/bloc.dart';

class AuthenticationPage extends StatefulWidget {
  /// 验证用户是否登录
  ///
  /// true 登录
  ///
  /// false 没有
  static Future<bool> verification(BuildContext context) {
    return Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) {
          return AuthenticationPage();
        }));
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
          _redirectToPage(context, true);
        } else if (state.hasFailed) {
          _redirectToPage(context, false);
        }
        return Container();
      },
    );
  }

  /// 由于我们无法直接从构建器重定向到另一个页面，因此我们使用WidgetsBinding.instance.addPostFrameCallback（）方法在呈现完成后请求Flutter执行方法
  void _redirectToPage(BuildContext context, bool result) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, result);
    });
  }
}
