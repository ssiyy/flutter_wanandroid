import 'package:flutter/material.dart';
import 'package:wanandroid/pages/login/login_page.dart';
import 'package:wanandroid/pages/main/main_page.dart';
import 'package:wanandroid/pages/register/register_page.dart';

///主程序入口
class Application extends StatefulWidget{
  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends  State<Application>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanAndroid',
      home: MainPage(),
    );
  }
}