import 'package:flutter/material.dart';
import 'package:kinject/kinject.dart';

import 'auth_bloc.dart';

class LoginPageV2 extends StatefulWidget {
  const LoginPageV2({super.key});

  @override
  State<LoginPageV2> createState() => _LoginPageV2State();
}

class _LoginPageV2State extends State<LoginPageV2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: context.resolve<LoginBloc>().login,
            child: const Text('Log in'),
          ),
        ),
      ),
    );
  }
}
