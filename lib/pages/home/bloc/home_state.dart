import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/data/home_bean.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class BannerLoadingState extends HomeState {}
class HomeListLoadingState extends HomeState {}

class LoadBannerFaileState extends HomeState {
  final String error;

  LoadBannerFaileState(this.error);

  @override
  List<Object> get props => [error];
}

class LoadHomeListFaileState extends HomeState {
  final String error;

  LoadHomeListFaileState(this.error);

  @override
  List<Object> get props => [error];
}

class LoadBannerSuccessState extends HomeState {
  final List<HomeBanner> banners;

  LoadBannerSuccessState(this.banners);

  @override
  List<Object> get props => [banners];
}

class LoadHomeListSuccessState extends HomeState {
  final HomeListPage homeListPage;

  LoadHomeListSuccessState(this.homeListPage);

  @override
  List<Object> get props => [homeListPage];
}
