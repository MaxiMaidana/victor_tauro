import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final Function(String)? onChange;
  final bool isPassword;
  const InputWidget({
    Key? key,
    required this.controller,
    this.hint,
    this.isPassword = false,
    this.onChange,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late bool isValid;
  bool eyeOpen = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && !eyeOpen ? true : false,
      autofocus: false,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  eyeOpen = !eyeOpen;
                  setState(() {});
                },
                child: Icon(
                  eyeOpen
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded,
                ),
              )
            : null,
        hintText: widget.hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
