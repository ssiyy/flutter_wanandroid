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

class UpdateHomeListState extends HomeState{
  final List<HomeList> homeLists;

  UpdateHomeListState(this.homeLists);

  @override
  List<Object> get props => [homeLists];
}


class HomeRefreshResState extends HomeState {
  final Resource res;

  HomeRefreshResState(this.res);

  @override
  List<Object> get props => [res];
}


class HomeLoadResState extends HomeState {
  final PageRes res;

  HomeLoadResState(this.res);

  @override
  List<Object> get props => [res];
}






