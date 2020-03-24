import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/pages/home/bloc/bloc.dart';

import 'home_repository.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    /* items.add((items.length+1).toString());
    if(mounted)
      setState(() {

      });*/
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(homeRepository: HomeRepository()),
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),
              footer: CustomFooter(builder: (context, mode) {
                Widget body;
                switch (mode) {
                  case LoadStatus.idle:
                    body = Text("上拉加载");
                    break;
                  case LoadStatus.loading:
                    body = CircularProgressIndicator();
                    break;
                  case LoadStatus.failed:
                    body = Text("加载失败！点击重试");
                    break;
                  case LoadStatus.canLoading:
                    body = Text("松手,加载更多!");
                    break;
                  default:
                    body = Text("没有更多数据了!");
                }
                return Container(
                  height: 55.0,
                  child: Center(
                    child: body,
                  ),
                );
              }),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(itemBuilder: null),
            )));
  }
}
