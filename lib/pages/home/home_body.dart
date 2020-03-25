import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/http/http_status.dart';
import 'package:wanandroid/pages/home/bloc/bloc.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  void _onRefresh() async {
    _homeBloc.add(HomeRefreshEvent());
    // monitor network fetch

    // if failed,use refreshFailed()
    // _refreshController.refreshCompleted();
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
    return BlocListener<HomeBloc, HomeState>(listener: (context, state) {
      if (state is HomeListRefreshState) {
        if (state.resource.status == Status.FAILE) {
          _refreshController.refreshFailed();
        } else if (state.resource.status == Status.SUCCESS) {
          _refreshController.refreshCompleted();
        }
      }
    }, child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SmartRefresher(
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
        child: _HomeListView(
            null), /*(state is HomeListRefreshState && state.resource.status == Status.SUCCESS)? _HomeListView(state.resource.data):null,*/
      );
    }));
  }
}

class _HomeListView extends StatelessWidget {
  final List<HomeList> items;

  _HomeListView(this.items);

  @override
  Widget build(BuildContext context) {
    /* return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
        return  _HomeListItemView(items[index]);
    });*/

    return ListView(
      children: <Widget>[_HomeListItemView(null)],
    );
  }
}

class _HomeListItemView extends StatelessWidget {
  final HomeList item;

  _HomeListItemView(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
           child: Image.asset(
             "assets/images/like_normal.png",
             width: 15,
             height: 15,
           ),
           margin: EdgeInsets.only(right: 10),
          )
          ,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "我是一长条测试文字我是一长条测试文字我是一长条测试文字我是一长条测试文字我是一长条测试文字我是一长条测试文字我是一长条测试文字",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                strutStyle: StrutStyle(
                  height: 1.5
                ),),
                Row(children: <Widget>[
                  Container(
                      child: Row(children: <Widget>[
                    Text(
                      "作者：",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      "张三",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )
                  ])),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(children: <Widget>[
                        Text(
                          "作者：",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "张三",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ])),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(children: <Widget>[
                        Text(
                          "作者：",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "张三",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ])),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
