import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}

///表示ui界面变化 - 清除账号数据
class ClearAccoutPressed extends LoginEvent {
  @override
  List<Object> get props => null;
}

///表示ui界面变化 - 显示隐藏密码
@immutable
class PasswordStatePressed extends LoginEvent {
  final bool visiable;

  PasswordStatePressed(this.visiable);

  factory PasswordStatePressed.visiable() {
    return PasswordStatePressed(true);
  }

  factory PasswordStatePressed.invisiable() {
    return PasswordStatePressed(false);
  }

  @override
  List<Object> get props => [visiable];
}
