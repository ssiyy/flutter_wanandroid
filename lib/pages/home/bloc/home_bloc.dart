import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/data/base_bean.dart';
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
      //刷新首页列表
        yield HomeListRefreshState(Resource.loading(null));
        try {
          final homeList = await _homeRepository.homeList(0);
          yield HomeListRefreshState(Resource.success(homeList));
        } on BaseBean catch (e) {
          yield HomeListRefreshState(Resource.faile(null, e.errorMsg));
        }catch(e){
          yield HomeListRefreshState(Resource.faile(null, e.toString()));
        }

        //刷新首页banner
        yield HomeBannerRefreshState(Resource.loading(null));
        try {
          final banners = await _homeRepository.homeBanner();
          yield HomeBannerRefreshState(Resource.success(banners));
        } on BaseBean catch (e) {
          yield HomeBannerRefreshState(Resource.faile(null, e.errorMsg));
        }catch(e){
          yield HomeBannerRefreshState(Resource.faile(null, e.toString()));
        }

    }
  }
}
