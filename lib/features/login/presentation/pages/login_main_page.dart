import 'package:flutter/material.dart';

import '../../../../core/widget_tree.dart';
import '../view/login_view.dart';
import 'package:victor_tauro/core/routes/routes.dart';
import 'package:universal_html/html.dart' as html;

class LoginLayout extends StatefulWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
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
        computer: const LoginView(),
      ),

      // drawer: DrawerPage(),
      // bottomNavigationBar: ResponsiveLayout.isPhone(context)
      //     ? Container()
      //     : const SizedBox(),
    );
  }
}
