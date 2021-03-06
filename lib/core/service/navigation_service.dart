import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> navigateTo(String routeName) =>
      navigatorKey.currentState!.pushNamed(routeName);

  void goBack(String routeName) => navigatorKey.currentState!.pop();
}
