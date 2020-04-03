/// 用户注册
/// POST params :username,password,repassword
const String USER_REGISTER = "user/register";

///用户登录
///POST params:username,password
const String USER_LOGIN = "user/login";

/// 用户退出
/// GET
const String USEER_LOGOUT = "logout/json";

///首页banner
///GET
const String HOME_BANNER = "banner/json";

///首页列表
///GET
const String HOME_LIST = "article/list/{page}/json";

///收藏站内文章
///post
const String FAVORITE_IN = "lg/collect/{id}/json";

///收藏站外文章
///POST
const String FAVORITE_OUT = "lg/collect/add/json";

///取消收藏
///文章列表
///post
const String FAVORITE_CANCEL = "lg/uncollect_originId/{id}/json";

///取消收藏
///我的收藏页面（该页面包含自己录入的内容）
///post
const String FAVORITE_CANCEL_MY = "lg/uncollect/{id}/json";


