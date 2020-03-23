import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/pages/login/bloc/login_event.dart';
import 'package:wanandroid/pages/login/bloc/login_state.dart';
import 'package:wanandroid/pages/login/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc({
    @required LoginRepository loginRepository,
  })  : assert(loginRepository != null),
        this._loginRepository = loginRepository;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      if (event.username.isEmpty || event.password.isEmpty) {
        yield LoginFailure(error: "账号或者密码为空");
      } else {
        try {
          await _loginRepository.login(event.username, event.password);
          yield LoginInitial();
        } on BaseBean catch (e) {
          yield LoginFailure(error: e.errorMsg);
        } catch (error) {
          yield LoginFailure(error: error.toString());
        }
      }
    }
  }
}
