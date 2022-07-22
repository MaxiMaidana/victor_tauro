import 'package:fluro/fluro.dart';
import 'package:victor_tauro/core/routes/routes.dart';
import 'package:victor_tauro/features/home/presentation/views/home_view.dart';
import 'package:victor_tauro/features/home/presentation/views/products_view.dart';
import 'package:victor_tauro/features/home/presentation/views/sales_view.dart';
import 'package:victor_tauro/features/home/presentation/views/stock_view.dart';
import 'package:victor_tauro/features/login/presentation/pages/login_main_page.dart';

import '../../features/error/presentation/pages/page_404.dart';
import '../../features/home/presentation/pages/home_main_page.dart';
import '../../features/home/presentation/views/products_item_view.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    //LOGIN
    router.define(
      Routes.login,
      handler: _loginHandler,
      transitionType: TransitionType.none,
    );

    //HOME
    router.define(
      Routes.home,
      handler: _homeHandler,
      transitionType: TransitionType.none,
    );

    //PRODUCTS
    router.define(
      Routes.products,
      handler: _productsHandler,
      transitionType: TransitionType.none,
    );
    router.define(
      '${Routes.products}/:id',
      handler: _productsHandler,
      transitionType: TransitionType.none,
    );

    //SALES
    router.define(
      Routes.sales,
      handler: _salesHandler,
      transitionType: TransitionType.none,
    );
    router.define(
      '${Routes.sales}/:id',
      handler: _salesHandler,
      transitionType: TransitionType.none,
    );

    //STOCK
    router.define(
      Routes.stock,
      handler: _stockHandler,
      transitionType: TransitionType.none,
    );
    router.define(
      '${Routes.stock}/:id',
      handler: _stockHandler,
      transitionType: TransitionType.none,
    );

    router.notFoundHandler = _errorHandler;
  }

  // Handlers
  static final Handler _loginHandler =
      Handler(handlerFunc: (context, params) => const LoginLayout());

  static final Handler _homeHandler = Handler(handlerFunc: (context, params) {
    return const HomeLayout(
      child: HomeView(),
    );
  });

  static final Handler _productsHandler =
      Handler(handlerFunc: (context, params) {
    if (params['id']?[0] != null) {
      return HomeLayout(
        child: ProductsItemView(productId: params['id']?[0] ?? 'Error'),
      );
    } else {
      return const HomeLayout(
        child: ProductsView(),
      );
    }
  });

  static final Handler _salesHandler = Handler(handlerFunc: (context, params) {
    return const HomeLayout(
      child: SalesView(),
    );
  });

  static final Handler _stockHandler = Handler(handlerFunc: (context, params) {
    return const HomeLayout(
      child: StockView(),
    );
  });

  static final Handler _errorHandler =
      Handler(handlerFunc: (context, params) => const Page404());
}
