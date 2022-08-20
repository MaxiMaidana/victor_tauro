import 'package:flutter/material.dart';
import 'package:victor_tauro/core/widgets/text_widget.dart';
// import 'dart:html' as html;

import '../constants.dart';

class ButtonWidget extends StatefulWidget {
  final String textButton;
  final bool? loading;
  final Widget? loadingWidget;
  final Color? color;
  final void Function()? onPress;

  const ButtonWidget({
    Key? key,
    required this.textButton,
    required this.onPress,
    this.loading = false,
    this.color,
    this.loadingWidget,
  }) : super(key: key);

  factory ButtonWidget.principal({
    required String textButton,
    void Function()? onPress,
    bool loading = false,
  }) =>
      ButtonWidget(
        loading: loading,
        textButton: textButton,
        onPress: onPress,
      );

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      onPressed: widget.onPress,
      // style: ButtonStyle(),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: widget.onPress == null
              ? Colors.grey
              : widget.color ?? kPrincipalColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 3),
              blurRadius: 3.5,
            ),
          ],
        ),
        child: widget.loading!
            ? widget.loadingWidget ??
                Center(
                    child: Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 1.0,
                  ),
                  child: const CircularProgressIndicator(color: Colors.white),
                ))
            : Center(child: TextWidget.button(widget.textButton)),
      ),
    );
  }
}
