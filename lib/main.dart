import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:victor_tauro/core/routes/router.dart';
import 'package:victor_tauro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:victor_tauro/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:victor_tauro/features/home/presentation/pages/home_main_page.dart';
import 'package:victor_tauro/features/home/presentation/provider/navigation_provider.dart';
import 'package:victor_tauro/features/login/presentation/bloc/login_bloc.dart';

import 'core/routes/routes.dart';
import 'core/service/local_storage.dart';
import 'core/service/navigation_service.dart';
import 'features/login/presentation/pages/login_main_page.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'locator.dart';

void main() async {
  await LocalStorage.configurePrefs();
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ProductsBloc()),
        BlocProvider(
          create: (context) => AuthCubit()..checkSession(),
          lazy: false,
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => NavigationProvider(),
        child: MaterialApp(
          title: 'Victor Tauro',
          initialRoute: Routes.login,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.pink),
          onGenerateRoute: Flurorouter.router.generator,
          navigatorKey: locator<NavigationService>().navigatorKey,
          // onGenerateRoute: (RouteSettings settings) =>
          //     RouteGenerator.generateRoute(settings),
          // builder: ((context, child) {
          //   // return
          //   // return BlocBuilder<AuthCubit, AuthState>(
          //   //   builder: (context, state) {
          //   //     if (state is AuthNologued) {
          //   //       log('salio el por el no logued');
          //   //       return const LoginLayout();
          //   //     }
          //   //     if (state is AuthLogued) {
          //   //       log('salio el por el logued');
          //   //       return const HomeLayout();
          //   //     } else {
          //   //       log('salio el por splash');
          //   //       return const SplashPage();
          //   //     }
          //   //   },
          //   // );
          // }),
        ),
      ),
    );
  }
}
