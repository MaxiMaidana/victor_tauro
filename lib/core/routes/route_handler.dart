// Handlers
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/routes/routes.dart';
import 'package:victor_tauro/features/auth/presentation/cubit/auth_cubit.dart';

import '../../features/error/presentation/pages/page_404.dart';
import '../../features/home/presentation/pages/home_main_page.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/products_item_view.dart';
import '../../features/home/presentation/views/products_view.dart';
import '../../features/home/presentation/views/sales_view.dart';
import '../../features/home/presentation/views/stock_view.dart';
import '../../features/login/presentation/pages/login_main_page.dart';
import '../../locator.dart';
import '../service/navigation_service.dart';
import 'package:universal_html/html.dart' as html;

final Handler loginHandler =
    Handler(handlerFunc: (context, params) => const LoginLayout());

final Handler homeHandler = Handler(handlerFunc: (context, params) {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      if (state is WithSession) {
        return const HomeLayout(
          child: HomeView(),
        );
      }

      return const LoginLayout();
    },
  );
});

final Handler productsHandler = Handler(handlerFunc: (context, params) {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      if (state is WithSession) {
        if (params['id']?[0] != null) {
          return HomeLayout(
            child:
                ProductsItemView(nailPolishId: params['id']?.first ?? 'Error'),
          );
        } else {
          return const HomeLayout(
            child: ProductsView(),
          );
        }
      }

      return const LoginLayout();
    },
  );
  // if (params['id']?[0] != null) {
  //   return HomeLayout(
  //     child: ProductsItemView(nailPolishId: params['id']?.first ?? 'Error'),
  //   );
  // } else {
  //   return const HomeLayout(
  //     child: ProductsView(),
  //   );
  // }
});

final Handler salesHandler = Handler(handlerFunc: (context, params) {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      if (state is WithSession) {
        return const HomeLayout(
          child: SalesView(),
        );
      }

      return const LoginLayout();
    },
  );
});

final Handler stockHandler = Handler(handlerFunc: (context, params) {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      if (state is WithSession) {
        return const HomeLayout(
          child: StockView(),
        );
      }

      return const LoginLayout();
    },
  );
});

final Handler errorHandler =
    Handler(handlerFunc: (context, params) => const Page404());
