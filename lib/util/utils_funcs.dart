import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> navigationBrowser(String url) async {
  if (await canLaunch(url)) {
    return await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw "Could not launch $url";
  }
}