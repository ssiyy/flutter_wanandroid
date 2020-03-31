// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  /* test("testing a future with completion", () {
    var netWorkData = getNetWorkData();
    expect(netWorkData, completion(equals(2)));
  });*/

  /*test("test error", () async {
    try {
      var error = await getNetData();
    } on String catch (e) {
      print("这里是异常对象：${e}");
    } catch (e, s) {
      print("类型：${e is String}");
      print(s);
    }
  });*/

/*  test("testing a future with expectAsync1 ", (){
    var netWorkData = getNetWorkData();
    netWorkData.then(expectAsync1((value){
        expect(2, value);
    })).catchError(expectAsync1((error){
      print("$error");
    }));
  });*/

  /*test("testing a future with completion", () {
    final h = Huby("d", "e", 2);

    print(h.age is int);

  });*/

  test("testing  RxDart", () {
    final cl = f();
    cl.s.listen((value){
      print(value);
    });
  });
}


L f(){
  final pageChannel = BehaviorSubject<int>();

  final cc =   pageChannel.map((value){
    return "value is $value";
  });

  pageChannel.sink.add(1);

  /*cc.listen((value) {
    print(value);
  });*/


  return L(cc);
}

class L{
  Stream<String> s;

  L(this.s);


}

class Huby extends Person {
  final int age;

  Huby(String firstName, String lastName, this.age)
      : super(firstName, lastName, age.toString());
}

class Person {
  final String firstName;
  final String lastName;
  final dynamic age;

  Person(this.firstName, this.lastName, this.age);
}

Future<String> getNetData() {
  return Future(() {
    sleep(Duration(seconds: 3));
    throw "我测试Error";
  });
}

Future<int> getNetWorkData() {
  return Future<int>(() {
    sleep(Duration(seconds: 3));
    return 2;
  });
}
