import 'package:flutter/widgets.dart';

import '../provider.dart';

/// extension for [BuildContext] to get any provided instance easily
extension ProviderExt on BuildContext {
  /// gets nearest instance and returns error if instance is null
  T resolve<T>() => Provider.resolve<T>(this)!;

  /// gets nearest instance and return null if instance can not be found
  T? maybeResolve<T>() => Provider.resolve<T>(this);
}
