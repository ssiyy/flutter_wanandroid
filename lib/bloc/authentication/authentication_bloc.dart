import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/bloc/authentication/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc(){

  }


  @override
  AuthenticationState get initialState =>
      AuthenticationState.notAuthenticated();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {}
}
