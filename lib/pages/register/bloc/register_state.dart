import 'package:flutter/material.dart';

abstract class RegisterState{
  const RegisterState();
}

///表示注册过程的状态 - 初始化
class RegisterInitial extends RegisterState {}

///表示注册过程的状态 - 注册中
class RegisterLoading extends RegisterState {}

///表示登录过程的状态 - 登录失败
class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}