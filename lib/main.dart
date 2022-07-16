import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/routes/router_generator.dart';
import 'package:victor_tauro/features/login/presentation/bloc/auth_bloc.dart';

import 'core/routes/routes.dart';
import 'core/service/navigation_service.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Victor Tauro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        onGenerateRoute: (RouteSettings settings) =>
            RouteGenerator.generateRoute(settings),
        navigatorKey: locator<NavigationService>().navigatorKey,
        initialRoute: Routes.login,
      ),
    );
  }
}
