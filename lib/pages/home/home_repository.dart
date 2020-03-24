import 'package:wanandroid/api/wanandroid_apis.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/util/http_utils.dart';

class HomeRepository {
  Future<BaseBean> homeList(int page) {
    return HttpService.instance.get(HOME_LIST, paths: {"page": page});
  }
}
