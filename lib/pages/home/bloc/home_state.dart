import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/data/base_bean.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class LoadBannerState extends HomeState {
  final List<Banner> banners;

  LoadBannerState(this.banners);

  @override
  List<Object> get props => [banners];
}

class LoadListState extends HomeState {
  final PageBean pageBean;

  LoadListState(this.pageBean);

  @override
  List<Object> get props => [pageBean];
}
