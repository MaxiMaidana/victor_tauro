import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/button_widget.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '404',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 25),
              const Text('No se encontro la pagina'),
              const SizedBox(height: 50),
              ButtonWidget.principal(
                textButton: 'Volver al login',
                onPress: () => context.go(Routes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
