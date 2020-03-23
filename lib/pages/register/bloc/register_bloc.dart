import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/data/base_bean.dart';
import 'package:wanandroid/pages/register/bloc/bloc.dart';
import 'package:wanandroid/pages/register/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _registerRepository;

  RegisterBloc({@required RegisterRepository registerRepository})
      : assert(registerRepository != null),
        this._registerRepository = registerRepository;

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();
      if (event.username.isEmpty ||
          event.password.isEmpty ||
          event.rePassword.isEmpty) {
        yield RegisterFailure(error: "账号或者密码为空");
      } else {
        try {
          await _registerRepository.register(
              event.username, event.password, event.rePassword);
          yield RegisterInitial();
        } on BaseBean catch (e) {
          yield RegisterFailure(error: e.errorMsg);
        } catch (e) {
          yield RegisterFailure(error: e.toString());
        }
      }
    }
  }
}
