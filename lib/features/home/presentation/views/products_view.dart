import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../locator.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text('Products', style: TextStyle(fontSize: 30)),
        const SizedBox(height: 20),
        SizedBox(
          height: size.height - 145,
          width: double.infinity,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            itemCount: 500,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () => locator<NavigationService>()
                    .navigateTo('${Routes.products}/$i'),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(child: Text(i.toString())),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
