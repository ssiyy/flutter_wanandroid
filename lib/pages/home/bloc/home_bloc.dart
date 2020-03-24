import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/data/base_bean.dart';
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
    if (event is RefreshEvent) {
        yield HomeListLoadingState();
        try {
          final homeList = await _homeRepository.homeList(0);
          yield LoadHomeListSuccessState(homeList);
        } on BaseBean catch (e) {
          yield LoadHomeListFaileState(e.errorMsg);
        }catch(e){
          yield LoadHomeListFaileState(e.toString());
        }

        yield BannerLoadingState();
        try {
          final banners = await _homeRepository.homeBanner();
          yield LoadBannerSuccessState(banners);
        } on BaseBean catch (e) {
          yield LoadBannerFaileState(e.errorMsg);
        }catch(e){
          yield LoadBannerFaileState(e.toString());
        }

    }
  }
}
