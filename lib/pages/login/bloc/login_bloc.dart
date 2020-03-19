import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/pages/login/bloc/login_event.dart';
import 'package:wanandroid/pages/login/bloc/login_state.dart';
import 'package:wanandroid/pages/login/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({
    @required this.loginRepository,
  }) : assert(loginRepository != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        await loginRepository.login(event.username, event.password);
        yield LoginInitial();
      } on BaseBean catch (e) {
        yield LoginFailure(error: e.errorMsg);
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    } else if (event is ClearAccoutPressed) {
      yield ClearAccout();
    } else if (event is PasswordStatePressed) {
      if (event.visiable) {
        yield PasswordState.visiable();
      } else {
        yield PasswordState.invisiable();
      }
    }
  }
}
