import 'package:flutter/foundation.dart';

abstract interface class AuthDataSource {
  void login();
  void signup();
}

final class AuthDataSourceImpl implements AuthDataSource {
  @override
  void login() {
    debugPrintThrottled('AuthDataSourceImpl: login process');
  }

  @override
  void signup() {
    debugPrintThrottled('AuthDataSourceImpl: signup process');
  }
}
