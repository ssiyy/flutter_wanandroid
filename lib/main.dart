import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wanandroid/application.dart';
import 'package:wanandroid/bloc/authentication/authentication_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => AuthenticationBloc())],
        child: Application());
  }
}
