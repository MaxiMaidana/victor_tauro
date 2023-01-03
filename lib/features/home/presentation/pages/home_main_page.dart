import 'package:flutter/material.dart';

import '../../../../core/widget_tree.dart';
import '../widgets/items_buttons.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  const HomeLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: ItemsButtons(),
      ),
      body: WidgetTree(
        tiny: child,
        phone: child,
        tablet: child,
        largeTablet: child,
        computer: child,
      ),

      // drawer: DrawerPage(),
      // bottomNavigationBar: ResponsiveLayout.isPhone(context)
      //     ? Container()
      //     : const SizedBox(),
    );
  }
}
