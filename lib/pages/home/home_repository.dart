import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/db/bean/home_bean_db.dart';
import 'package:wanandroid/db/database_helper.dart';
import 'package:wanandroid/http/http_status.dart';
import 'package:wanandroid/http/http_urls.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/util/fetch_net_task.dart';
import 'package:wanandroid/util/http_utils.dart';

class HomeRepository {
  final Future<HomeListBean> _homeListBean;

  final Future<HomeBannerBean> _homeBannerBean;

  HomeRepository()
      : _homeListBean = DatabaseHelper.instance.createBean((adapter) {
          final bean = HomeListBean(adapter);
          bean.tagBean.createTableHelper(ifNotExists: true);
          return bean;
        }),
        _homeBannerBean = DatabaseHelper.instance.createBean((adapter) {
          return HomeBannerBean(adapter);
        });

  ///首页列表
  Listing<List<HomeList>> homeList() {
    return loadDataByPage(loadFromDb: () async* {
      final homeListBean = await _homeListBean;
      final lists = await homeListBean.getAll();
      //这里需要做一下级联查询
      yield* Stream.fromFuture(homeListBean.preloadAll(lists, cascade: true));
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
        //关联的tag表也要删除
        await homeListBean.tagBean.removeAll();
      }

      //不是刷新处理一下相关数据，主要是Tag那里的外键依赖
      final lists = list.map((value) {
        final tags = value.tags;
        final witdHomeIdTags = tags.map((tag) {
          tag.homeId = value.id;
          return tag;
        }).toList();

        value.tags = witdHomeIdTags;
        return value;
      }).toList();

      await homeListBean.insertMany(lists, cascade: true);
      return;
    });
  }

  ///Banner页面
  Stream<Resource<List<HomeBanner>>> homeBanner() {
    return loadData(loadFromDb: () async* {
      final homeBannerBean = await _homeBannerBean;
      yield* Stream.fromFuture(homeBannerBean.getAll());
    }, fetch: () {
      return HttpService.instance.get(HOME_BANNER, fromJson: (basebean) {
        return (basebean.data as List).map((item) {
          return HomeBanner.fromJson(item);
        }).toList();
      });
    }, saveCallResult: (value) async {
      final homeBannerBean = await _homeBannerBean;
      await homeBannerBean.insertMany(value);
      return;
    });
  }

  Future<BaseBean> favorite(int id, bool isAdd) {
    if (isAdd) {
      //收藏
      return HttpService.instance.post(FAVORITE_IN, paths: {"id": id});
    } else {
      return HttpService.instance.post(FAVORITE_CANCEL, paths: {"id": id});
    }
  }
}
