import 'package:flutter/material.dart';

import '../../../../core/widget_tree.dart';
import '../view/home_view.dart';
import '../widgets/items_buttons.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
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
          children: const [
            ItemsButtons(),
            HomeView(),
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
