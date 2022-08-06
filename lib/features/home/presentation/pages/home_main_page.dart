import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:victor_tauro/features/home/presentation/provider/navigation_provider.dart';

import '../../../../core/widget_tree.dart';
import '../views/home_view.dart';
import '../views/products_view.dart';
import '../views/sales_view.dart';
import '../views/stock_view.dart';
import '../widgets/items_buttons.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(double.infinity, 100),
      //   child: (ResponsiveLayout.isTinyLimit(context) ||
      //           ResponsiveLayout.isTinyHeightLimit(context))
      //       ? Container()
      //       : AppBarWidget(),
      // ),
      body: WidgetTree(
        tiny: Container(),
        phone: Container(),
        tablet: Container(),
        largeTablet: Container(),
        computer: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: navigationProvider.scrollController,
              children: const [
                HomeView(),
                // widget.child!
                ProductsView(),
                StockView(),
                SalesView(),
              ],
            ),
            const ItemsButtons(),
          ],
        ),
      ),

      // drawer: DrawerPage(),
      // bottomNavigationBar: ResponsiveLayout.isPhone(context)
      //     ? Container()
      //     : const SizedBox(),
    );
  }
}
