import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:wanandroid/db/bean/home_bean_db.dart';
import 'package:wanandroid/db/database_helper.dart';
import 'package:wanandroid/http/http_status.dart';
import 'package:wanandroid/http/http_urls.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/util/fetch_net_task.dart';
import 'package:wanandroid/util/http_utils.dart';

class HomeRepository {
  final Future<HomeListBean> _homeListBean;

  HomeRepository()
      : _homeListBean = DatabaseHelper.instance.createBean((adapter) {
          return HomeListBean(adapter);
        });

  Listing<List<HomeList>> homeList() {
    /*return HttpService.instance.get(HOME_LIST, paths: {"page": page},
        fromJson: (baseBean) {
      return HomeListPage.fromJson(baseBean.data);
    });*/

    return loadDataByPage(loadFromDb: () async* {
      final homeListBean = await _homeListBean;
      yield* Stream.fromFuture(homeListBean.getAll());
    }, createReqNetParamByPage: (pageIndex) {
      return pageIndex;
    }, fetchNet: (pageIndex) {
      return HttpService.instance.get(HOME_LIST, paths: {"page": pageIndex},
          fromJson: (baseBean) {
        return HomeListPage.fromJson(baseBean.data).datas;
      });
    }, insertDb: (List<HomeList> list, bool isRefresh) async {
      final homeListBean = await _homeListBean;
      if (isRefresh) {
        //如果是刷新把之前的都删除
        await homeListBean.removeAll();
      }

      //不是刷新处理一下相关数据，主要是Tag那里的外键依赖
      final lists = list.map((value) {
        final tags = value.tags;
        final witdHomeIdTags = tags.map((tag) {
          tag.homeId = value.id;
        }).toList();

        value.tags = witdHomeIdTags;
      }).toList();

      await homeListBean.insertMany(lists);
    });
  }

  Future<List<HomeBanner>> homeBanner() {
    return HttpService.instance.get(HOME_BANNER, fromJson: (basebean) {
      return (basebean.data as List).map((item) {
        return HomeBanner.fromJson(item);
      }).toList();
    });
  }
}
