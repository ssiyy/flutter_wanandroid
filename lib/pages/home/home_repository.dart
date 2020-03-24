import 'package:wanandroid/api/wanandroid_apis.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/util/http_utils.dart';

class HomeRepository {
  Future<PageBean> homeList(int page) {
    return HttpService.instance.get(HOME_LIST, paths: {"page": page},
        fromJson: (baseBean) {
      return PageBean.fromJson(baseBean.data);
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
