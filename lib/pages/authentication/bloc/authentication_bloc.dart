import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/pages/authentication/bloc/bloc.dart';
import 'package:wanandroid/util/http_utils.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState =>
      AuthenticationState.notAuthenticated();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    yield AuthenticationState.authenticating();
    final auth = await HttpService.instance.authentication();
    if (auth) {
      yield AuthenticationState.authenticated();
    } else {
      yield AuthenticationState.failure();
    }
  }
}
