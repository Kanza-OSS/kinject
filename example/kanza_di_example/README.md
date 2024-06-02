```dart
import 'package:flutter/material.dart';
import 'package:kanza_di/kanza_di.dart';
import 'package:kanza_di_example/auth_bloc.dart';
import 'package:kanza_di_example/auth_data_source.dart';
import 'package:kanza_di_example/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Kinjects(
      kinjects: [
        ProxyKinject<AuthDataSource>((_) => AuthDataSourceImpl()),
        ProxyKinject<AuthRepository>(
          (context) => AuthRepositoryImpl(
            context.resolve<AuthDataSource>(),
          ),
        ),
        ProxyKinject<LoginBloc>(
          (context) => LoginBloc(
            context.resolve<AuthRepository>(),
          ),
        ),
      ],
      builder: (context) {
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
      },
    );
  }
}

```