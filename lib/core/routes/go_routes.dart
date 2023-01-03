import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:victor_tauro/core/routes/routes.dart';
import 'package:victor_tauro/features/home/presentation/views/home_view.dart';
import 'package:victor_tauro/features/home/presentation/views/sales_view.dart';
import 'package:victor_tauro/features/home/presentation/views/stock_view.dart';

import '../../features/error/presentation/pages/page_404.dart';
import '../../features/home/presentation/pages/home_main_page.dart';
import '../../features/home/presentation/views/products_item_view.dart';
import '../../features/home/presentation/views/products_view.dart';
import '../../features/login/presentation/pages/login_main_page.dart';
import '../service/local_storage.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.main,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.main,
      redirect: (context, state) {
        // String newRoute = '';
        if (LocalStorage.getPref('auth')) {
          log('al home');
          return Routes.home;
        } else {
          log('al login');
          return Routes.login;
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginLayout(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return HomeLayout(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.home,
          builder: (BuildContext context, GoRouterState state) {
            LocalStorage.setPref('inicio_pos', true);
            LocalStorage.setPref('products_pos', false);
            LocalStorage.setPref('sales_pos', false);
            LocalStorage.setPref('stock_pos', false);
            return const HomeView();
          },
        ),
        GoRoute(
          path: Routes.products,
          builder: (BuildContext context, GoRouterState state) {
            LocalStorage.setPref('products_pos', true);
            LocalStorage.setPref('inicio_pos', false);
            LocalStorage.setPref('sales_pos', false);
            LocalStorage.setPref('stock_pos', false);
            return const ProductsView();
          },
        ),
        GoRoute(
          path: '${Routes.products}/:id',
          builder: (BuildContext context, GoRouterState state) {
            return ProductsItemView(
                nailPolishId: state.params['id'] ?? 'Error');
          },
        ),
        GoRoute(
          path: Routes.sales,
          builder: (BuildContext context, GoRouterState state) {
            LocalStorage.setPref('sales_pos', true);
            LocalStorage.setPref('inicio_pos', false);
            LocalStorage.setPref('products_pos', false);
            LocalStorage.setPref('stock_pos', false);
            return const SalesView();
          },
        ),
        GoRoute(
          path: Routes.stock,
          builder: (BuildContext context, GoRouterState state) {
            LocalStorage.setPref('stock_pos', true);
            LocalStorage.setPref('inicio_pos', false);
            LocalStorage.setPref('products_pos', false);
            LocalStorage.setPref('sales_pos', false);
            return const StockView();
          },
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Routes.errorPage,
      builder: (context, state) => const Page404(),
    ),
  ],
);
