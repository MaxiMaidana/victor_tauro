// Handlers
import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:victor_tauro/core/routes/routes.dart';
import 'package:victor_tauro/features/home/presentation/provider/navigation_provider.dart';

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

final Handler homeHandler = Handler(
  handlerFunc: (context, params) {
    print(params);
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: const HomeLayout(
          // index: 1,
          // child: HomeView(),
          ),
    );

    // if (params[0]?.first == Routes.products ||
    //     params[0]?.first == Routes.stock ||
    //     params[0]?.first == Routes.sales) {
    //   return ChangeNotifierProvider(
    //     create: (context) => NavigationProvider(),
    //     child: const HomeLayout(
    //         // child: HomeView(),
    //         ),
    //   );
    // } else {
    //   return ChangeNotifierProvider(
    //     create: (context) => NavigationProvider(),
    //     child: const HomeLayout(
    //         // child: HomeView(),
    //         ),
    //   );
    // }
  },
);
final Handler initHandler = Handler(
  handlerFunc: (context, params) {
    final navigationProvider =
        Provider.of<NavigationProvider>(context!, listen: false);
    final page = params['page']!.first;
    if (page != '/') {
      if (params['page']?.first == 'home') {
        navigationProvider.createScrollController(page);

        return const HomeLayout(
            // child: HomeView(),
            );
      }
      if (params['page']?.first == 'products') {
        navigationProvider.createScrollController(page);

        return const HomeLayout(
            // child: HomeView(),
            );
      }
      if (params['page']?.first == 'stock') {
        navigationProvider.createScrollController(page);

        return const HomeLayout(
            // child: HomeView(),
            );
      }
      if (params['page']?.first == 'sales') {
        navigationProvider.createScrollController(page);
        // navigationProvider.goTo(3);
        return const HomeLayout(
            // child: HomeView(),
            );
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
