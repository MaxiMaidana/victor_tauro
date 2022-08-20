import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/service/local_storage.dart';
import 'package:victor_tauro/features/login/domain/usecases/sign_in.dart';

import '../../../../core/constants.dart';
import '../../../../data/models/user/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      SignIn signIn = SignIn();
      bool isLogued =
          await signIn(user: event.user.user, password: event.user.password);
      await Future.delayed(const Duration(seconds: 1));
      if (isLogued) {
        LocalStorage.prefs.setBool(userLogued, isLogued);
        emit(LoginLogued());
      } else {
        emit(LoginError());
      }
    });
    on<InitialEvent>((event, emit) {
      emit(LoginInitial());
    });
  }
}
