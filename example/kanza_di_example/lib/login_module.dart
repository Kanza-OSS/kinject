import 'package:flutter/widgets.dart';
import 'package:kinject/kinject.dart';

import 'auth_bloc.dart';
import 'auth_data_source.dart';
import 'auth_repository.dart';
import 'login_page_v2.dart';

class LoginModule extends KinjectModule {
  const LoginModule({super.key});

  @override
  List<ProxyKinject> binds(BuildContext context) {
    return [
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
    ];
  }

  @override
  Widget child(BuildContext context) {
    return const LoginPageV2();
  }
}
