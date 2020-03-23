import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String password;
  final String rePassword;

  const RegisterButtonPressed({
    @required this.username,
    @required this.password,
    @required this.rePassword,
  });

  @override
  List<Object> get props => [username, password, rePassword];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password,password: $rePassword }';
}
