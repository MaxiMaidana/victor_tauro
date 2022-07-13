import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victor_tauro/core/widgets/button_widget.dart';
import 'package:victor_tauro/data/models/user.dart';
import 'package:victor_tauro/features/login/presentation/bloc/auth_bloc.dart';

import '../../../../core/widgets/input_widget.dart';
import '../../../home/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: LayoutBuilder(
        builder: (context, boxConstraints) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 250),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
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
                      onPress: () {
                        context.read<AuthBloc>().add(AuthLogin(
                            User(user: user.text, password: pass.text)));
                      },
                    ),
                  ],
                );
              }
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is AuthLogued) {
                // Future.delayed(const Duration(seconds: 1));
                Navigator.of(context).pushNamed('/home');
                // setState(() {});

                return const Text('logueado');
              } else {
                return const Text('error');
              }
            },
          ),
        ),
      ),
    );
  }
}
