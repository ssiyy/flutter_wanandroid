import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/pages/home/bloc/bloc.dart';
import 'package:wanandroid/pages/home/home_body.dart';

import 'home_repository.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(homeRepository: HomeRepository()),
            child:  HomeBody()));
  }


}
