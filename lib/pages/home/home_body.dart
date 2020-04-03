import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/http/http_status.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanandroid/pages/authentication/authentication_page.dart';
import 'package:wanandroid/pages/home/bloc/bloc.dart';
import 'package:wanandroid/pages/login/login_page.dart';

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
    _homeBloc = BlocProvider.of<HomeBloc>(context)..add(StartListEvent());
  }

  void _onRefresh() async {
    _homeBloc.add(RefreshListEvent());
  }

  void _onLoading() async {
    _homeBloc.add(LoadListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeRefreshResState) {
            if (state.res.status == Status.FAILE) {
              _refreshController.refreshFailed();
            } else if (state.res.status == Status.SUCCESS) {
              _refreshController.refreshCompleted();
            }
          } else if (state is HomeLoadResState) {
            if (state.res.status == PageStatus.FAILE) {
              _refreshController.loadFailed();
            } else if (state.res.status == PageStatus.COMPLETE) {
              _refreshController.loadComplete();
            } else if (state.res.status == PageStatus.END) {
              _refreshController.loadNoData();
            }
          }
        },
        child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header:
                WaterDropHeader(complete: Text("刷新完成"), failed: Text("刷新失败")),
            footer: _buildListFooter(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: _buildContent()));
  }

  Widget _buildContent() {
    return CustomScrollView(
      slivers: <Widget>[
        // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
        SliverToBoxAdapter(
            child:
                BlocBuilder<HomeBloc, HomeState>(condition: (context, state) {
          return state is BannerListState;
        }, builder: (context, sate) {
          if (sate is BannerListState) {
            return _buildBanner(sate.homeBanners);
          } else {
            return Container();
          }
        })),

        BlocBuilder<HomeBloc, HomeState>(
                condition: (context,state){
                  return state is UpdateHomeListState;
                },
              builder: (context,state){
                if(state is UpdateHomeListState){
                  return SliverList(
                    delegate: _buildList(state.homeLists),
                  );
                }else{
                  return SliverList(
                    delegate: _buildList([]),
                  );
                }

              },
        )
      ],
    );
  }
  Widget _buildListFooter() {
    return CustomFooter(builder: (context, mode) {
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
    });
  }

  Widget _buildBanner(List<HomeBanner> banners) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: Swiper(
          itemCount: banners.length,
          duration: 5000,
          pagination: new SwiperPagination(),
          itemBuilder: (context, index) {
            return Image.network(
              banners[index].imagePath,
              fit: BoxFit.fill,
            );
          },
        ));
  }

  SliverChildBuilderDelegate _buildList(List<HomeList> items) {
    return SliverChildBuilderDelegate(
      (context, index) {
        return _HomeListItemView(items[index]);
      },
      childCount: items.length,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: GestureDetector(
                      onTap: () async {
                        final result =
                            await AuthenticationPage.verification(context);

                        if (result) {
                          BlocProvider.of<HomeBloc>(context)
                              .add(FavoriteEvent(item.id, !item.collect));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => UserLoginPage()));
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.favorite,
                            color: item.collect ? Colors.cyan : Colors.grey,
                            size: 14),
                      )),
                  margin: EdgeInsets.only(right: 10),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.title,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        strutStyle: StrutStyle(height: 1.5),
                      ),
                      Row(children: <Widget>[
                        Container(
                            child: Row(children: <Widget>[
                          Text(
                            "作者：",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            item.author,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          )
                        ])),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(children: <Widget>[
                              Text(
                                "分类：",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                "${item.superChapterName}/${item.chapterName}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              )
                            ])),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Row(children: <Widget>[
                                  Text(
                                    "时间：",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  Expanded(
                                      child: Text(
                                    item.niceDate,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ))
                                ]))),
                      ])
                    ],
                  ),
                )
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: <Widget>[for (Tag tag in item.tags) bindWrapItem(tag)],
            )
          ],
        ));
  }

  Widget bindWrapItem(Tag tag) {
    return Container(
        margin: EdgeInsets.only(left: 2, right: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular((5))),
            border:
                Border.all(color: Colors.blueAccent.withAlpha(60), width: 1.0),
            color: colors[Random().nextInt(colors.length)]),
        child: Padding(
          padding: EdgeInsets.only(left: 6, top: 4, right: 6, bottom: 4),
          child: Text(
            tag.name,
            style: TextStyle(fontSize: 8, color: Colors.black),
          ),
        ));
  }

  final colors = [
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.cyan,
    Colors.deepOrange
  ];
}
