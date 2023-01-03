import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants.dart';
import '../../../../core/routes/routes.dart';
import '../bloc/products/products_bloc.dart';

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
              onTap: () => context.push(Routes.home),
              hoverColor: kPrincipalColor,
              child: const Center(child: Text('Inicio')),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () {
                context.read<ProductsBloc>().add(ProductsGet());
                context.push(Routes.products);
              },
              hoverColor: kPrincipalColor,
              child: const Center(child: Text('Productos')),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () => context.push(Routes.stock),
              hoverColor: kPrincipalColor,
              child: const Center(child: Text('Stock')),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 70,
            child: InkWell(
              onTap: () => context.push(Routes.sales),
              hoverColor: kPrincipalColor,
              child: const Center(child: Text('Ventas')),
            ),
          ),
        ),
      ],
    );
  }
}
