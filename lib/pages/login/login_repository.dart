import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/util/http_utils.dart';
import 'package:wanandroid/http/wanandroid_apis.dart';

class LoginRepository {
  Future<BaseBean> login(String userName, String pwd) async {
    return HttpService.instance
        .post(USER_LOGIN, params: {"username": userName, "password": pwd});
  }
}
