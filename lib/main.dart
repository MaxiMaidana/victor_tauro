import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:victor_tauro/core/routes/go_routes.dart';
import 'package:victor_tauro/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:victor_tauro/features/login/presentation/bloc/auth_bloc.dart';

import 'core/service/local_storage.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  await LocalStorage.configPrefs();
  // setupLocator();
  // Flurorouter.configureRoutes();

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
        // BlocProvider(create: (context) => AuthCubit()..checkSession()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp.router(
          title: 'Victor Tauro',
          routerConfig: goRouter,
          // initialRoute: Routes.login,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.pink),
          // onGenerateRoute: Flurorouter.router.generator,
          // navigatorKey: locator<NavigationService>().navigatorKey,
          // onGenerateRoute: (RouteSettings settings) =>
          //     RouteGenerator.generateRoute(settings),
        ),
      ),
    );
  }
}
