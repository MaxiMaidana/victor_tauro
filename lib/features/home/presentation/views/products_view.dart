import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../locator.dart';
import '../bloc/products/products_bloc.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductsCharged) {
          return Column(
            children: [
              const SizedBox(height: 70),
              const Text('Products', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              SizedBox(
                height: size.height - 125,
                width: double.infinity,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  itemCount: state.products.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        // locator<NavigationService>()
                        //     .navigateTo('${Routes.products}/$i');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('${state.products[i].name}'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Image.network(
                                      state.products[i].urlPhoto!),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    'Nombre del proovedor: ${state.products[i].distributor}'),
                                const SizedBox(height: 10),
                                Text(
                                    'Nombre del color: ${state.products[i].colorName}'),
                                const SizedBox(height: 10),
                                Text(
                                    'Codigo de color: ${state.products[i].colorCod}'),
                                const SizedBox(height: 10),
                                Text(
                                    'Codigo de barras: ${state.products[i].barcode}'),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Image.network(state.products[i].urlPhoto!),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
