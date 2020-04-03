import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AuthenticationState extends Equatable {
  final bool isAuthenticated;
  final bool isAuthenticating;
  final bool hasFailed;

  AuthenticationState(
      {@required this.isAuthenticated,
      @required this.isAuthenticating,
      @required this.hasFailed});

  @override
  List<Object> get props => [isAuthenticated, hasFailed, isAuthenticating];

  factory AuthenticationState.notAuthenticated() {
    return AuthenticationState(
      isAuthenticated: false,
      isAuthenticating: false,
      hasFailed: false,
    );
  }

  factory AuthenticationState.authenticated() {
    return AuthenticationState(
      isAuthenticated: true,
      isAuthenticating: false,
      hasFailed: false,
    );
  }

  factory AuthenticationState.authenticating() {
    return AuthenticationState(
      isAuthenticated: false,
      isAuthenticating: true,
      hasFailed: false,
    );
  }

  factory AuthenticationState.failure() {
    return AuthenticationState(
      isAuthenticated: false,
      isAuthenticating: true,
      hasFailed: true,
    );
  }
}
