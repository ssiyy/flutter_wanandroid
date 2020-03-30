import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/http/http_status.dart';

abstract class RegisterState extends Equatable{
  const RegisterState();
}

///表示注册过程的状态 - 初始化
class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}


class RegisterBtnPressState extends RegisterState {
    final Resource resource;
    const RegisterBtnPressState(this.resource);

    @override
    List<Object> get props => [resource];
}