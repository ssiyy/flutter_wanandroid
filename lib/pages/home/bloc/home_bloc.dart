import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/data/home_bean.dart';
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

  ///列表
  StreamSubscription<List<HomeList>> _listSubscription;

  ///刷新状态
  StreamSubscription<Resource> _refreshSubscription;

  ///加载状态
  StreamSubscription<PageRes> _loadSubscription;

  ///刷新的方法
  EmptyFunc _refreshFunc;

  ///加载更多的方法
  EmptyFunc _loadFunc;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    //外边事件
    try {
      if (event is StartListEvent) {
            final listing = _homeRepository.homeList();
            _listSubscription?.cancel();
            _listSubscription =  listing.list.listen((value){
              print("dfdffffff");
              add(HomeListEvent(value));});

            _refreshSubscription?.cancel();
            _refreshSubscription = listing.refreshStatus .listen((value) => add(HomeRefreshResEvent(value)));

            _loadSubscription?.cancel();
            _loadSubscription =  listing.loadStatus.listen((value) => add(HomeLoadResEvent(value)));
            _refreshFunc = listing.refresh;
            _loadFunc = listing.loadData;
          } else if (event is RefreshListEvent) {
            if (_refreshFunc != null) {
              _refreshFunc();
            }
          }else if(event is LoadListEvent){
            if(_loadFunc != null){
              _loadFunc();
            }
          }
    } catch (e) {
      print(e);
    }

    //内部事件
    if (event is HomeListEvent) {
      yield UpdateHomeListState(event.homeLists);
    } else if (event is HomeRefreshResEvent) {
      yield HomeRefreshResState(event.res);
    } else if (event is HomeLoadResEvent) {
      yield HomeLoadResState(event.res);
    }
  }

  @override
  Future<void> close() {
    _listSubscription?.cancel();
    _refreshSubscription?.cancel();
    _loadSubscription?.cancel();
    return super.close();
  }
}
