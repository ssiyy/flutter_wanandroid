import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wanandroid/util/utils_funcs.dart';

class WebViewPage extends StatefulWidget {
  final String title;

  final String url;

  const WebViewPage({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {

  void _onMenuItemSelect(String value) async{
    switch(value){
      case "browser":
       navigationBrowser(widget.url);
        break;
      case "share":
        Share.share("${widget.title}:${widget.url}");
        break;
      default:
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: _onMenuItemSelect,
              itemBuilder: (_) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      value: "browser",
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.language,
                            color: Colors.grey,
                            size: 22,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "浏览器打开",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF666666)),
                            ),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: "share",
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.share,
                            color: Colors.grey,
                            size: 22,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "分享",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF666666)),
                              ))
                        ],
                      ),
                    )
                  ])
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
        //JS运行模式
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
