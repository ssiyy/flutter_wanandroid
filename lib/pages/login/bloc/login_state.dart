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

///表示ui界面变化 - 清除账号数据
class ClearAccout extends LoginState {}

///表示ui界面变化 - 显示隐藏密码
@immutable
class PasswordState extends LoginState {
  final bool visiable;

  PasswordState(this.visiable);

  factory PasswordState.visiable() {
    return PasswordState(true);
  }

  factory PasswordState.invisiable() {
    return PasswordState(false);
  }
}
