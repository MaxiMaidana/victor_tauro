import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/service/navigation_service.dart';
import 'package:victor_tauro/features/login/presentation/bloc/auth_bloc.dart';
import 'package:victor_tauro/locator.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/login_column.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 250),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogued) {
            locator<NavigationService>().navigateTo(Routes.home);
            // Navigator.pushReplacementNamed(context, Routes.home);
          }
          if (state is AuthError) {
            locator<NavigationService>().navigateTo(Routes.errorPage);
            // Navigator.pushReplacementNamed(context, Routes.errorPage);
            context.read<AuthBloc>().add(InitialEvent());
          }
        },
        builder: (context, state) {
          if (state is AuthInitial) {
            return const LoginColumn();
          }
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
