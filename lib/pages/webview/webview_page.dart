import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String title;

  final String url;

  const WebViewPage({Key key, @required this.title, @required this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title,maxLines: 1,overflow: TextOverflow.ellipsis),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
              itemBuilder:(_)=><PopupMenuItem<String>>,
          )
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
