class Api {
  /// 用户注册
  /// post方法 params :username,password,repassword
  static const String USER_REGISTER = "user/register";

  ///用户登录
  ///post方法 params:username,password
  static const String USER_LOGIN = "user/login";

  /// 用户退出
  /// GET
  static const String USEER_LOGOUT = "logout/json";
}
