import 'package:fluro/fluro.dart';
import 'package:victor_tauro/core/routes/route_handler.dart';
import 'package:victor_tauro/core/routes/routes.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    //LOGIN
    router.define(
      Routes.login,
      handler: loginHandler,
      transitionType: TransitionType.none,
    );

    //HOME
    router.define(
      Routes.home,
      handler: homeHandler,
      transitionType: TransitionType.none,
    );

    //PRODUCTS
    router.define(
      Routes.products,
      handler: productsHandler,
      transitionType: TransitionType.none,
    );
    router.define(
      '${Routes.products}/:id',
      handler: productsHandler,
      transitionType: TransitionType.none,
    );

    //SALES
    router.define(
      Routes.sales,
      handler: salesHandler,
      transitionType: TransitionType.none,
    );
    router.define(
      '${Routes.sales}/:id',
      handler: salesHandler,
      transitionType: TransitionType.none,
    );

    //STOCK
    router.define(
      Routes.stock,
      handler: stockHandler,
      transitionType: TransitionType.none,
    );
    router.define(
      '${Routes.stock}/:id',
      handler: stockHandler,
      transitionType: TransitionType.none,
    );

    router.notFoundHandler = errorHandler;
  }
}
