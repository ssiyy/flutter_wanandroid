// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("testing a future with completion", () {
    var netWorkData = getNetWorkData();
    expect(netWorkData, completion(equals(2)));
  });


  test("testing a future with expectAsync1 ", (){
    var netWorkData = getNetWorkData();
    netWorkData.then(expectAsync1((value){
        expect(2, value);
    })).catchError(expectAsync1((error){
      print("$error");
    }));
  });
}




Future<int> getNetWorkData() {
  return Future<int>(() {
    sleep(Duration(seconds: 3));
    return 2;
  });
}
