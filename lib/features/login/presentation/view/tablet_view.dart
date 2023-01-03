import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:victor_tauro/core/service/navigation_service.dart';
import 'package:victor_tauro/features/login/presentation/bloc/auth_bloc.dart';
import 'package:victor_tauro/locator.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/login_column.dart';

class TabletView extends StatefulWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogued) {
            // locator<NavigationService>().navigateTo(Routes.home);
            context.go(Routes.home);
          }
          if (state is AuthError) {
            // locator<NavigationService>().navigateTo(Routes.errorPage);
            context.go(Routes.errorPage);
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
