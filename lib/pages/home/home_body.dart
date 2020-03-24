import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/data/home_bean.dart';
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
    return BlocListener<HomeBloc,HomeState>(
        listener: (context, state) {
          if(state is LoadHomeListFaileState){
            _refreshController.isRefresh = true
          }

        },
        child: BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
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
            child: (state is LoadHomeListSuccessState)? _HomeListView(state.homeListPage.datas):null,
          );
        }));
  }
}

class _HomeListView extends StatelessWidget{
  final List<HomeList> items;

  _HomeListView(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
        return  _HomeListItemView(items[index]);
    });
  }
}

class _HomeListItemView extends StatelessWidget{
  final HomeList item;
  _HomeListItemView(this.item);

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
