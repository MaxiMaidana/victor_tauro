// Handlers
import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:victor_tauro/core/routes/routes.dart';
import 'package:victor_tauro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:victor_tauro/features/home/presentation/provider/navigation_provider.dart';

import '../../features/error/presentation/pages/page_404.dart';
import '../../features/home/presentation/pages/home_main_page.dart';
import 'package:universal_html/html.dart' as html;
import '../../features/login/presentation/pages/login_main_page.dart';

import '../../locator.dart';
import '../service/navigation_service.dart';

final Handler loginHandler =
    Handler(handlerFunc: (context, params) => const LoginLayout());

final Handler homeHandler = Handler(
  handlerFunc: (context, params) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: const HomeLayout(
          // index: 1,
          // child: HomeView(),
          ),
    );
  },
);
final Handler initHandler = Handler(
  handlerFunc: (context, params) {
    final navigationProvider =
        Provider.of<NavigationProvider>(context!, listen: false);
    final page = params['page']!.first;
    if (page != '/') {
      if (params['page']?.first == 'home' ||
          params['page']?.first == 'products' ||
          params['page']?.first == 'stock' ||
          params['page']?.first == 'sales') {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLogued) {
              navigationProvider.createScrollController(page);
              return const HomeLayout();
            } else {
              navigationProvider.tokenDead();
              // html.window.history.pushState(null, 'none', '#${Routes.login}');
              // html.document.title = 'Login';
              return const LoginLayout();
            }
          },
        );
      } else {
        return const Page404();
      }
    }
    return null;
  },
);

// final Handler productsHandler = Handler(handlerFunc: (context, params) {
//   if (params['id']?[0] != null) {
//     return const HomeLayout(
//         // child: ProductsItemView(nailPolishId: params['id']?.first ?? 'Error'),
//         );
//   } else {
//     return const HomeLayout(
//         // child: ProductsView(),
//         );
//   }
// });

// final Handler salesHandler = Handler(handlerFunc: (context, params) {
//   return const HomeLayout(
//       // child: SalesView(),
//       );
// });

// final Handler stockHandler = Handler(handlerFunc: (context, params) {
//   return const HomeLayout(
//       // child: StockView(),
//       );
// });

final Handler errorHandler =
    Handler(handlerFunc: (context, params) => const Page404());
