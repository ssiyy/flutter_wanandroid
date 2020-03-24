import 'package:flutter/material.dart';
import 'package:wanandroid/pages/home/home_repository.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
         final fdfdf =  await HomeRepository().homeList(1);
         print(fdfdf.curPage);
        },
       child: Text("fdfdfdfdfd"),
      )
    );
  }
}
