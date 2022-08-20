import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../locator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        // listener: (context, state) {
        //   if (state is AuthLogued) {
        //     locator<NavigationService>().navigateTo(Routes.home);
        //   }
        //   if (state is AuthNologued) {
        //     locator<NavigationService>().navigateTo(Routes.login);
        //   }
        // },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Charging ...'),
            ],
          );
        },
      ),
    );
  }
}
