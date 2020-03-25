import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/http/http_status.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeBannerRefreshState extends HomeState{
  final Resource resource;

  HomeBannerRefreshState(this.resource);

  @override
  List<Object> get props => [resource];
}

class HomeListRefreshState extends HomeState{
  final Resource resource;

  HomeListRefreshState(this.resource);

  @override
  List<Object> get props => [resource];
}
