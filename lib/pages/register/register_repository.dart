import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/http/wanandroid_apis.dart';
import 'package:wanandroid/util/http_utils.dart';

class RegisterRepository {
  Future<BaseBean> register(String userName, String pwd, String rePwd) {
    return HttpService.instance.post(USER_REGISTER,
        params: {"username": userName, "password": pwd, "repassword": rePwd});
  }
}
