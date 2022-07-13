import 'package:flutter/material.dart';
import 'package:victor_tauro/core/widget_tree.dart';

import '../../features/home/presentation/pages/home_page.dart';

Map<String, Widget Function(BuildContext)> mapRoutes() => {
      '/': (BuildContext context) => const WidgetTree(),
      '/home': (BuildContext context) => const HomePage()
    };
