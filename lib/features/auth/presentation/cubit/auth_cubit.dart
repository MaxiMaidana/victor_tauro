import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/service/local_storage.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../locator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void checkSession() {
    bool res = LocalStorage.prefs.getBool(userLogued) ?? false;
    if (res) {
      emit(AuthLogued());
      // locator<NavigationService>().navigateTo(Routes.home);
    } else {
      emit(AuthNologued());
      // locator<NavigationService>().navigateTo(Routes.login);
    }
    // if (state is AuthLogued) {
    //         locator<NavigationService>().navigateTo(Routes.home);
    //       }
    //       if (state is AuthNologued) {
    //         locator<NavigationService>().navigateTo(Routes.login);
    //       }
  }
}
