import 'package:flutter/material.dart';
import 'package:victor_tauro/features/home/presentation/views/products_view.dart';

import '../../../../core/widget_tree.dart';
import '../views/home_view.dart';
import '../widgets/items_buttons.dart';

class HomeLayout extends StatefulWidget {
  final Widget? child;
  const HomeLayout({Key? key, this.child}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
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
        computer: Column(
          children: [
            const ItemsButtons(),
            // HomeView(),
            widget.child!
            // ProductsView(),
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
