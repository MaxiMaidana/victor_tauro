import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/service/navigation_service.dart';
import 'package:victor_tauro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:victor_tauro/features/login/presentation/bloc/login_bloc.dart';
import 'package:victor_tauro/locator.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/login_column.dart';
import 'package:universal_html/html.dart' as html;

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    html.window.history.pushState(null, 'none', '#${Routes.login}');
    html.document.title = 'Login';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 250),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLogued) {
            context.read<AuthCubit>().checkSession();
            locator<NavigationService>().navigateTo(Routes.home);
          }
          if (state is LoginError) {
            locator<NavigationService>().navigateTo(Routes.errorPage);
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const LoginColumn();
          }
        },
      ),
    );
  }
}
