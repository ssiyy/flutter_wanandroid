import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/pages/home/home_page.dart';

///主页
class MainPage extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller

  List _tabs = ["首页", "历史", "图片"];

  DateTime _lastPressedAt; //上次点击时间

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wanandroid"),
        leading: Icon(Icons.android),
        bottom: TabBar(
            controller: _tabController,
            tabs: _tabs.map((name) => Tab(text: name)).toList()),
      ),
      body: Builder(builder: (context) {
        final _onWillPop = () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();

            Scaffold.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    "再点击一次返回键退出",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                ),
              );
            return false;
          }
          return true;
        };

        return WillPopScope(onWillPop: _onWillPop, child: _tabView(context));
      }),
    );
  }

  Widget _tabView(BuildContext context) {
    return TabBarView(controller: _tabController, children: <Widget>[
          HomePage(),
          Container(
            child: Text("fdfdfdf"),
          ),
          Container(
            child: Text("fdfdfdf"),
          ),
        ]);
  }
}
