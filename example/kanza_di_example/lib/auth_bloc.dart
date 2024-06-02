import 'package:flutter/foundation.dart';
import 'package:kanza_di_example/auth_repository.dart';

final class LoginBloc {
  const LoginBloc(this.authRepository);

  final AuthRepository authRepository;

  void login() {
    debugPrintThrottled('LoginBloc: login processing...');
    authRepository.login();
  }
}
