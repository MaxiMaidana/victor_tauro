import 'package:flutter/cupertino.dart';

class ProductsItemView extends StatefulWidget {
  final String productId;
  const ProductsItemView({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductsItemView> createState() => _ProductsItemViewState();
}

class _ProductsItemViewState extends State<ProductsItemView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('item ${widget.productId}'),
      ],
    );
  }
}
