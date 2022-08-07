import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final String title;
  final bool isSelected;

  const ItemMenu({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Center(child: Text(title)),
          ),
        ),
        Visibility(
          visible: isSelected ? true : false,
          child: const Divider(),
        ),
      ],
    );
  }
}
