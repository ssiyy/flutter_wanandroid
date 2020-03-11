import 'package:flutter/material.dart';
import 'package:wanandroid/util/util.dart';

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
  double _scale = 0.7;

  /// 账号，密码的包裹父布局的key
  GlobalKey _contentBody = GlobalKey();

  //动画控制器
  var _logoAnimate = Tween(begin: 1.0, end: 0.7);

  AnimationController _logoController;

  @override
  void initState() {
    super.initState();
    _logoController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
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
    setState(() {
      _logoAnimate = Tween(begin: 1.0, end: 0.7);
      if (_logoController.isCompleted) {
        _logoController.reset();
        _logoController.forward();
      } else {
        //正向动画开始
        _logoController.forward();
      }
    });

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
      Tween(begin: 1.0, end: 0.5).animate(_logoController);
      _logoController.forward();
    }
  }

  ///软键盘弹回时候调用
  void _onSoftKeyboardClosed() {
    setState(() {
      _logoAnimate = Tween(begin: 0.7, end: 1);

      if (_logoController.isCompleted) {
        _logoController.reset();
        _logoController.forward();
      } else {
        //正向动画开始
        _logoController.forward();
      }
    });
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

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
    _screenSize = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            body: Builder(
                builder: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: ScaleTransition(
                                //设置动画的缩放中心
                                alignment: Alignment.center,
                                scale: _logoAnimate.animate(_logoController),
                                child: Center(
                                    child:
                                        Image.asset("assets/images/logo.png")),
                              )),
                          Column(
                            key: _contentBody,
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                    labelText: "账号",
                                    prefixIcon: Icon(Icons.account_box),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.cyan),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    TextField(
                                      decoration: InputDecoration(
                                          labelText: "密码",
                                          prefixIcon: Icon(Icons.lock),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.cyan),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          )),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.visibility),
                                      onPressed: () {
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                        Util.showSnackBar(context, "fffff");
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                width: double.infinity,
                                child: RaisedButton(
                                  child: Text("登录"),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          )
                        ]))));
  }
}
