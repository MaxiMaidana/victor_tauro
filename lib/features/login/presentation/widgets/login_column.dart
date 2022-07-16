import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/input_widget.dart';
import '../../../../data/models/user.dart';
import '../bloc/auth_bloc.dart';

class LoginColumn extends StatefulWidget {
  const LoginColumn({Key? key}) : super(key: key);

  @override
  State<LoginColumn> createState() => _LoginColumnState();
}

class _LoginColumnState extends State<LoginColumn> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Victor Tauro', style: TextStyle(fontSize: 40)),
        const SizedBox(height: 50),
        InputWidget(
          hint: 'usuario',
          controller: user,
        ),
        const SizedBox(height: 50),
        InputWidget(
          hint: 'contraseña',
          isPassword: true,
          controller: pass,
        ),
        const SizedBox(height: 50),
        ButtonWidget.principal(
          textButton: 'Continuar',
          onPress: () => context
              .read<AuthBloc>()
              .add(AuthLogin(User(user: user.text, password: pass.text))),
        ),
      ],
    );
  }
}
