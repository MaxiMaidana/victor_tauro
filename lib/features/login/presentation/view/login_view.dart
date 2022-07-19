import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/service/navigation_service.dart';
import 'package:victor_tauro/features/login/presentation/bloc/auth_bloc.dart';
import 'package:victor_tauro/locator.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/login_column.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 250),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogued) {
            locator<NavigationService>().navigateTo(Routes.home);
          }
          if (state is AuthError) {
            locator<NavigationService>().navigateTo(Routes.errorPage);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const LoginColumn();
          }
        },
      ),
    );
  }
}
