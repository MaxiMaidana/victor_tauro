import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/input_widget.dart';
import '../../../../data/models/user/user.dart';
import '../bloc/auth_bloc.dart';
import 'package:universal_html/html.dart' as html;

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
    // html.window.history.pushState(null, 'none', '#${Routes.login}');
    // html.document.title = 'Login';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Victor Tauro', style: TextStyle(fontSize: 40)),
        SizedBox(height: 10.h),
        InputWidget(
          hint: 'usuario',
          controller: user,
        ),
        SizedBox(height: 5.h),
        InputWidget(
          hint: 'contraseña',
          isPassword: true,
          controller: pass,
        ),
        SizedBox(height: 10.h),
        ButtonWidget.principal(
          textButton: 'Continuar',
          onPress: () {
            context.read<AuthBloc>().add(
                  AuthLogin(
                    User(user: user.text, password: pass.text),
                  ),
                );
          },
        ),
      ],
    );
  }
}
