import 'package:wanandroid/data/register_bean.dart';
import 'package:wanandroid/http/http_status.dart';
import 'package:wanandroid/http/http_urls.dart';
import 'package:wanandroid/util/fetch_net_task.dart';
import 'package:wanandroid/util/http_utils.dart';

class RegisterRepository {
  Stream<Resource<Register>> register(String userName, String pwd,
      String rePwd) {
    return fetchNetResource(fetchNet: () {
      return HttpService.instance.post(USER_REGISTER,
          params: {"username": userName, "password": pwd, "repassword": rePwd},
          fromJson: (result) {
            final register = Register.fromJson(result.data);
            return register;
          });
    });
  }
}
