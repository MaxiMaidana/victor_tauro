import 'package:flutter/cupertino.dart';

class StockView extends StatefulWidget {
  const StockView({Key? key}) : super(key: key);

  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Stock'),
      ],
    );
  }
}
