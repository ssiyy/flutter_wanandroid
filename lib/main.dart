import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:wanandroid/application.dart';


final logger = Logger(
  printer: PrettyPrinter(
    colors: false,//颜色AS无法使用
  ),
);


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WanAndroid",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Application(),
    );
  }
}