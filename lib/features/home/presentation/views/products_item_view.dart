import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/data/models/products/nail_polish.dart';

import '../bloc/products/products_bloc.dart';

class ProductsItemView extends StatefulWidget {
  final String nailPolishId;
  const ProductsItemView({Key? key, required this.nailPolishId})
      : super(key: key);

  @override
  State<ProductsItemView> createState() => _ProductsItemViewState();
}

class _ProductsItemViewState extends State<ProductsItemView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsCharged) {
          NailPolish nailPolish =
              state.products[int.parse(widget.nailPolishId)];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                '${nailPolish.name}',
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.network(nailPolish.urlPhoto!),
                ),
              ),
              SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text('Nombre del proovedor: ${nailPolish.distributor}'),
                    const SizedBox(height: 10),
                    Text('Nombre del color: ${nailPolish.colorName}'),
                    const SizedBox(height: 10),
                    Text('Codigo de color: ${nailPolish.colorCod}'),
                    const SizedBox(height: 10),
                    Text('Codigo de barras: ${nailPolish.barcode}'),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
