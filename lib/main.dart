import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/routes/router.dart';
import 'package:victor_tauro/features/home/presentation/pages/home_main_page.dart';
import 'package:victor_tauro/features/login/presentation/bloc/auth_bloc.dart';

import 'core/routes/routes.dart';
import 'core/service/navigation_service.dart';
import 'locator.dart';

void main() {
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
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'Victor Tauro',
        initialRoute: Routes.login,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.pink),
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: locator<NavigationService>().navigatorKey,
        // builder: (_, child) {
        //   return HomeLayout(child: child ?? Container());
        // },
        // onGenerateRoute: (RouteSettings settings) =>
        //     RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
