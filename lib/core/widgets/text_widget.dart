import 'package:flutter/material.dart';

/// Widget custom de texto.
///
/// Utilizar los factory(title, sentence o button).
class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  const TextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color,
  }) : super(key: key);

  /// Estilo de texto para los titlos.
  ///
  /// Tamaño de letra de 25.
  ///
  /// Color de letra negro no customisable
  factory TextWidget.title(String text, {Key? key}) => TextWidget(
        text: text,
        fontSize: 25,
      );

  /// Estilo de texto para las frases.
  ///
  /// Tamaño de letra de 17.
  ///
  /// Color de letra negro no customisable
  factory TextWidget.sentence(String text, {Key? key}) => TextWidget(
        text: text,
        fontSize: 17,
        color: Colors.black54,
      );

  /// Estilo de texto para los botones.
  ///
  /// Tamaño de letra de 15.
  ///
  /// Color de letra negro no customisable
  factory TextWidget.button(String text, {Key? key}) => TextWidget(
        text: text,
        fontSize: 15,
        color: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}
