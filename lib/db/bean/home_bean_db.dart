import 'dart:core';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/db/database_helper.dart';

part 'home_bean_db.jorm.dart';

@GenBean()
class HomeListBean extends Bean<HomeList> with _HomeListBean, HelperBean {
  TagBean tagBean;

  HomeListBean(Adapter adapter)
      : tagBean = TagBean(adapter),
        super(adapter);

  @override
  String get tableName => "home_list";

  @override
  Future<void> createTableHelper({bool ifNotExists = false}) {
    return createTable(ifNotExists: ifNotExists);
  }
}

@GenBean()
class TagBean extends Bean<Tag> with _TagBean, HelperBean {
  HomeListBean _homeListBean;

  HomeListBean get homeListBean => _homeListBean ?? HomeListBean(adapter);

  TagBean(Adapter adapter) : super(adapter);

  @override
  String get tableName => "tags";

  @override
  Future<void> createTableHelper({bool ifNotExists = false}) {
    return createTable(ifNotExists: ifNotExists);
  }
}

@GenBean()
class HomeBannerBean extends Bean<HomeBanner> with _HomeBannerBean, HelperBean {
  @override
  String get tableName => "home_banner";

  HomeBannerBean(Adapter adapter):super(adapter);

  @override
  Future<void> createTableHelper({bool ifNotExists = false}) {
    return createTable(ifNotExists: ifNotExists);
  }
}
