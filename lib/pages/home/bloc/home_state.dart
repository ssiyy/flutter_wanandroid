import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/data/home_bean.dart';
import 'package:wanandroid/http/http_status.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeRefreshState extends HomeState{
  final Resource<Tuple2<List<HomeBanner>,List<HomeList>>> resource;

  HomeRefreshState(this.resource);

  @override
  List<Object> get props => [resource];
}
