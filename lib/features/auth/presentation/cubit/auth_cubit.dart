import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:victor_tauro/core/service/local_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void checkSession() {
    bool res = LocalStorage.getPref('auth');
    if (res) {
      emit(WithSession());
    } else {
      emit(WithOutSession());
    }
  }
}
