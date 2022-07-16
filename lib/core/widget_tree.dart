import 'package:flutter/material.dart';
import 'package:victor_tauro/core/responsive_layout.dart';
import 'package:victor_tauro/features/login/presentation/view/login_view.dart';

class WidgetTree extends StatefulWidget {
  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;
  const WidgetTree({
    Key? key,
    required this.tiny,
    required this.phone,
    required this.tablet,
    required this.largeTablet,
    required this.computer,
  }) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  // int currentIndex = 1;

  // List<Widget> _icons = [
  //   Icon(Icons.add, size: 30),
  //   Icon(Icons.list, size: 30),
  //   Icon(Icons.compare_arrows, size: 30),
  // ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tiny: widget.tiny,
      phone: widget.phone,
      tablet: widget.tablet,
      largeTablet: widget.largeTablet,
      computer: widget.computer,
    );
  }
}
