import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:victor_tauro/features/home/presentation/widgets/item_manu.dart';

import '../../../../core/constants.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../locator.dart';
import '../bloc/products/products_bloc.dart';
import '../provider/navigation_provider.dart';

class ItemsButtons extends StatefulWidget {
  const ItemsButtons({Key? key}) : super(key: key);

  @override
  State<ItemsButtons> createState() => _ItemsButtonsState();
}

class _ItemsButtonsState extends State<ItemsButtons> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    print('esto anda bien???');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () {
                // locator<NavigationService>().navigateTo(Routes.home);
                navigationProvider.goTo(0);
              },
              hoverColor: kPrincipalColor,
              child: const ItemMenu(title: 'Home', isSelected: false),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () {
                context.read<ProductsBloc>().add(ProductsGet());
                navigationProvider.goTo(1);
                // locator<NavigationService>().navigateTo(Routes.products);
              },
              hoverColor: kPrincipalColor,
              child: const ItemMenu(title: 'Productos', isSelected: false),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () {
                navigationProvider.goTo(2);
                // locator<NavigationService>().navigateTo(Routes.stock);
              },
              hoverColor: kPrincipalColor,
              child: const ItemMenu(title: 'Stock', isSelected: false),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () {
                navigationProvider.goTo(3);
                // locator<NavigationService>().navigateTo(Routes.sales);
              },
              hoverColor: kPrincipalColor,
              child: const ItemMenu(title: 'Ventas', isSelected: false),
            ),
          ),
        ),
      ],
    );
  }
}
