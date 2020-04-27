import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/http/http_status.dart';
import 'package:wanandroid/pages/home/bloc/bloc.dart';
import 'package:wanandroid/pages/home/home_repository.dart';
import 'package:wanandroid/util/extension_func.dart';

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

  ///首页banner
  StreamSubscription<List<HomeBanner>> _homeBannerSubscription;

  ///刷新的方法
  EmptyFunc _refreshFunc;

  ///加载更多的方法
  EmptyFunc _loadFunc;

  void updateHomeBanner() {
    _homeBannerSubscription?.cancel();
    _homeRepository.homeBanner().map((value) {
      return value.data;
    }).listen((value) {
      if (!value.isNullOrEmpty()) {
        add(BannerListEvent(value));
      }
    });
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    //外边事件
    if (event is StartListEvent) {
      final listing = _homeRepository.homeList();
      _listSubscription?.cancel();
      _listSubscription =
          listing.list.listen((value) => add(HomeListEvent(value)));

      _refreshSubscription?.cancel();
      _refreshSubscription = listing.refreshStatus
          .listen((value) => add(HomeRefreshResEvent(value)));

      _loadSubscription?.cancel();
      _loadSubscription =
          listing.loadStatus.listen((value) => add(HomeLoadResEvent(value)));
      _refreshFunc = listing.refresh;
      _loadFunc = listing.loadData;

      updateHomeBanner();
    } else if (event is RefreshListEvent) {
      _refreshFunc?.call();
      updateHomeBanner();
    } else if (event is LoadListEvent) {
      _loadFunc?.call();
    } else if (event is FavoriteEvent) {
      //收藏
      final result = await _homeRepository.favorite(event.id, event.isAdd);
      yield FavoriteState(result.isSuccess);
    }else if(event is FloatingBtnChangeEvent){
      yield FloatingChangeState();
    }

    //内部事件
    if (event is HomeListEvent) {
      yield UpdateHomeListState(event.homeLists);
    } else if (event is HomeRefreshResEvent) {
      yield HomeRefreshResState(event.res);
    } else if (event is HomeLoadResEvent) {
      yield HomeLoadResState(event.res);
    } else if (event is BannerListEvent) {
      yield BannerListState(event.homeBanners);
    }
  }

  @override
  Future<void> close() {
    _listSubscription?.cancel();
    _refreshSubscription?.cancel();
    _loadSubscription?.cancel();
    _homeBannerSubscription?.cancel();
    return super.close();
  }
}
