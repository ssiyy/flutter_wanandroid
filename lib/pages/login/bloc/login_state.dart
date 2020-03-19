import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

///表示登录过程的状态 - 初始化
class LoginInitial extends LoginState {}

///表示登录过程的状态 - 登录中
class LoginLoading extends LoginState {}

///表示登录过程的状态 - 登录失败
class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
