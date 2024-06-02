import 'package:flutter/foundation.dart';
import 'package:kanza_di_example/auth_data_source.dart';

abstract interface class AuthRepository {
  void login();
  void signup();
}

final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.authDataSource);

  final AuthDataSource authDataSource;

  @override
  void login() {
    debugPrintThrottled('AuthRepositoryImpl: login process');
    authDataSource.login();
  }

  @override
  void signup() {
    debugPrintThrottled('AuthRepositoryImpl: signup process');
  }
}
