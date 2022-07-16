import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:victor_tauro/core/routes/routes.dart';
import 'package:victor_tauro/features/home/presentation/pages/home_page.dart';

import '../../features/error/presentation/pages/page_404.dart';
import '../../features/login/presentation/pages/login_main_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return _fadeRoute(const LoginMainPage(), Routes.login);
      case Routes.home:
        return _fadeRoute(const HomePage(), Routes.home);
      default:
        return _fadeRoute(const Page404(), Routes.errorPage);
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      pageBuilder: (_, __, ___) => child,
      transitionDuration: const Duration(microseconds: 200),
      transitionsBuilder: (_, animation, __, ___) => kIsWeb
          ? child
          : FadeTransition(
              opacity: animation,
              child: child,
            ),
    );
  }
}
