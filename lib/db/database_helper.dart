import 'dart:async';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:wanandroid/db/database_adapter.dart';

mixin HelperBean {
  Future<void> createTableHelper({bool ifNotExists = false});
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  ///单例模式的一种写法，来自于：https://stackoverflow.com/questions/54057958/comparing-ways-to-create-singletons-in-dart
  ///将允许您在返回实例之前做其他工作。
  static DatabaseHelper get instance {
    return _instance;
  }

  Database _database;

  DatabaseAdapter _sqfliteAdapter;

  final _dbName = "wanandroid.db";

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    //  /data/data/flutter.siy.wanandroid/databases/wanandroid.db
    final path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: 1);
  }

  Future<T> createBean<T extends Bean>(T create(SqfliteAdapter adapter)) async {
    if (_sqfliteAdapter == null) {
      _sqfliteAdapter = DatabaseAdapter.fromConnection(await database);
    }
    final bean = create(_sqfliteAdapter);
    try {
      //尝试创建一下表，只有当不存在的时候才创建
      (bean as HelperBean).createTableHelper(ifNotExists: true);
    } catch (e) {
      print(e);
    }
    return bean;
  }
}
