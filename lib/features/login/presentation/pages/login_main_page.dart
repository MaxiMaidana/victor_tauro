import 'package:flutter/material.dart';

import '../../../../core/widget_tree.dart';
import '../view/login_view.dart';

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({Key? key}) : super(key: key);

  @override
  State<LoginMainPage> createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
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
        computer: const LoginPage(),
      ),

      // drawer: DrawerPage(),
      // bottomNavigationBar: ResponsiveLayout.isPhone(context)
      //     ? Container()
      //     : const SizedBox(),
    );
  }
}
