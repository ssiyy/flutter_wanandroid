import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/pages/login/login_form.dart';

///
///   账号：flutter_user
///   密码：flutter
class UserLoginPage extends StatefulWidget {
  @override
  UserLoginState createState() => UserLoginState();
}

class UserLoginState extends State<UserLoginPage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  /// 屏幕的尺寸
  Size _screenSize;

  /// 缩放比例
  static final double _scale = 0.7;

  /// 账号，密码的包裹父布局的key
  GlobalKey _contentBody = GlobalKey();

  ///logo的缩放动画
  var _logoScalTween = Tween(begin: 1.0, end: _scale);

  ///logo的平移动画
  var _logoSlidTween = Tween(begin: Offset.zero, end: Offset(0, 0));

  ///动画控制器
  AnimationController _logoController;

  ///用户账号
  TextEditingController _accoutController = TextEditingController();

  ///用户密码
  TextEditingController _pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _logoController.dispose();
    super.dispose();
  }

  /// 软键盘弹出时候调用,[keyboardHeightInPx]键盘的高度
  void _onSoftKeyboardOpened(double keyboardHeightInPx) {
    //获取body在屏幕中的坐标，控件左上角
    RenderBox box = _contentBody.currentContext.findRenderObject();
    var offset = box.localToGlobal(Offset(0.0, box.size.height));

    //body控件的底部坐标
    var bodyBottom = offset.dy;
    //键盘的顶部坐标
    var keyboardTop = _screenSize.height - keyboardHeightInPx;

    if (bodyBottom > keyboardTop) {
      //如果内容控件被键盘覆盖
      //需要移动的距离
      var offsetY = bodyBottom - keyboardTop;
      setState(() {
        _logoSlidTween = Tween(
            //平移动画，用offsetY除以_contentBody得到需要平移自身尺寸的百分比
            begin: Offset.zero,
            end: Offset(0, -offsetY / box.size.height));
        //正向动画开始
        _logoController.forward();
      });
    }
  }

  ///软键盘弹回时候调用
  void _onSoftKeyboardClosed() {
    setState(() {
      if (_logoController.isCompleted) {
        _logoController.reverse();
      }
    });
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    //用来监听键盘的相关事件
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var keySoftHeight = MediaQuery.of(context).viewInsets.bottom;
      if (keySoftHeight > 0) {
        _onSoftKeyboardOpened(keySoftHeight);
      } else {
        _onSoftKeyboardClosed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //获取屏幕的尺寸
    _screenSize = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          //点击除了Editext之外的地方隐藏软键盘
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Builder(
                builder: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: SlideTransition(
                                  position: _logoSlidTween.animate(
                                      CurvedAnimation(
                                          parent: _logoController,
                                          curve: Curves.ease)),
                                  child: ScaleTransition(
                                    //设置动画的缩放中心
                                    alignment: Alignment.center,
                                    scale:
                                        _logoScalTween.animate(_logoController),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/images/logo.png",
                                      fit: BoxFit.fill,
                                      width: 300,
                                      height: 180,
                                    )),
                                  ))),
                          SlideTransition(
                            position: _logoSlidTween.animate(CurvedAnimation(
                                parent: _logoController, curve: Curves.ease)),
                            child: LoginForm(
                               key: _contentBody,
                            )
                          )
                        ]))));
  }
}
