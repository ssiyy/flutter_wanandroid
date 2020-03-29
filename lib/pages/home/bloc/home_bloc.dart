import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/db/bean/home_bean_db.dart';
import 'package:wanandroid/db/database_helper.dart';
import 'package:wanandroid/http/http_status.dart';
import 'package:wanandroid/pages/home/bloc/bloc.dart';
import 'package:wanandroid/pages/home/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc({@required HomeRepository homeRepository})
      : assert(homeRepository != null),
        this._homeRepository = homeRepository;

  @override
  HomeState get initialState => HomeStateInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeRefreshEvent) {
      yield HomeRefreshState(Resource.loading(null));
      try {
        //刷新首页banner
        final banners = await _homeRepository.homeBanner();
        //刷新首页列表
        final homeList = await _homeRepository.homeList(0);
        yield HomeRefreshState(
            Resource.success(Tuple2(banners, homeList.datas)));
      } on BaseBean catch (e) {
        yield HomeRefreshState(Resource.faile(null, e.errorMsg));
      } catch (e) {
        yield HomeRefreshState(Resource.faile(null, e.toString()));
      }
    }
  }
}
