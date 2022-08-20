import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/routes/router.dart';
import 'package:victor_tauro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:victor_tauro/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:victor_tauro/features/login/presentation/bloc/auth_bloc.dart';

import 'core/routes/routes.dart';
import 'core/service/local_storage.dart';
import 'core/service/navigation_service.dart';
import 'locator.dart';

void main() async {
  await LocalStorage.configPrefs();
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
        BlocProvider(create: (context) => ProductsBloc()),
        BlocProvider(create: (context) => AuthCubit()..checkSession()),
      ],
      child: MaterialApp(
        title: 'Victor Tauro',
        initialRoute: Routes.login,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.pink),
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: locator<NavigationService>().navigatorKey,
        // onGenerateRoute: (RouteSettings settings) =>
        //     RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
