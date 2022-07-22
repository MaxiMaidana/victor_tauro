import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../locator.dart';

class ItemsButtons extends StatefulWidget {
  const ItemsButtons({Key? key}) : super(key: key);

  @override
  State<ItemsButtons> createState() => _ItemsButtonsState();
}

class _ItemsButtonsState extends State<ItemsButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () => locator<NavigationService>().navigateTo(Routes.home),
              hoverColor: kPrincipalColor,
              child: const Center(
                child: Text('Inicio'),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () =>
                  locator<NavigationService>().navigateTo(Routes.products),
              hoverColor: kPrincipalColor,
              child: const Center(
                child: Text('Productos'),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () =>
                  locator<NavigationService>().navigateTo(Routes.stock),
              hoverColor: kPrincipalColor,
              child: const Center(
                child: Text('Stock'),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () =>
                  locator<NavigationService>().navigateTo(Routes.sales),
              hoverColor: kPrincipalColor,
              child: const Center(
                child: Text('Ventas'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
