import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanandroid/http/http_status.dart';
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
      if (event.username.isEmpty ||
          event.password.isEmpty ||
          event.rePassword.isEmpty) {
        yield RegisterBtnPressState(Resource.faile(null, "账号或者密码为空"));
      } else {
        yield* _registerRepository
            .register(event.username, event.password, event.rePassword)
            .map((value) {
          return RegisterBtnPressState(value);
        });
      }
    }
  }
}
