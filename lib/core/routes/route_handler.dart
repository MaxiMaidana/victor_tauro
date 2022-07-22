// Handlers
import 'package:fluro/fluro.dart';

import '../../features/error/presentation/pages/page_404.dart';
import '../../features/home/presentation/pages/home_main_page.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/products_item_view.dart';
import '../../features/home/presentation/views/products_view.dart';
import '../../features/home/presentation/views/sales_view.dart';
import '../../features/home/presentation/views/stock_view.dart';
import '../../features/login/presentation/pages/login_main_page.dart';

final Handler loginHandler =
    Handler(handlerFunc: (context, params) => const LoginLayout());

final Handler homeHandler = Handler(handlerFunc: (context, params) {
  return const HomeLayout(
    child: HomeView(),
  );
});

final Handler productsHandler = Handler(handlerFunc: (context, params) {
  if (params['id']?[0] != null) {
    return HomeLayout(
      child: ProductsItemView(productId: params['id']?.first ?? 'Error'),
    );
  } else {
    return const HomeLayout(
      child: ProductsView(),
    );
  }
});

final Handler salesHandler = Handler(handlerFunc: (context, params) {
  return const HomeLayout(
    child: SalesView(),
  );
});

final Handler stockHandler = Handler(handlerFunc: (context, params) {
  return const HomeLayout(
    child: StockView(),
  );
});

final Handler errorHandler =
    Handler(handlerFunc: (context, params) => const Page404());
