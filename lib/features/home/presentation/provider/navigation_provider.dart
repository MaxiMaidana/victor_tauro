import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class NavigationProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = ['home', 'products', 'stock', 'sales'];

  void createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
  }

  int getPageIndex(String routeName) {
    final index = _pages.indexOf(routeName);
    return index == -1 ? 0 : index;
  }

  void goTo(int index) {
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
