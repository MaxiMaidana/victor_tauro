import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/features/login/domain/usecases/sign_in.dart';

import '../../../../data/models/user/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      SignIn signIn = SignIn();
      bool isLogued =
          await signIn(user: event.user.user, password: event.user.password);
      await Future.delayed(const Duration(seconds: 1));
      if (isLogued) {
        emit(AuthLogued());
      } else {
        emit(AuthError());
      }
    });
    on<InitialEvent>((event, emit) {
      emit(AuthInitial());
    });
  }
}
