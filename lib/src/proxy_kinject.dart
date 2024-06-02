import 'package:flutter/widgets.dart';

import 'kinject.dart';

/// Builder for factory instance in the [ProxyKinject] instance
typedef ProxyKinjectBuilder<T> = T Function(BuildContext context);

/// {@template proxy_kinject}
/// Widget which provides instance within [factory] callback and
/// maintains its dispose state
/// {@endtemplate}
class ProxyKinject<T> {
  /// {@macro proxy_kinject}
  ProxyKinject(this.factory);

  /// The method which will return the instance of our dependency
  final ProxyKinjectBuilder<T> factory;

  /// function which will return [Kinject] instance for the next [ProxyKinject]
  Kinject<T> inject(WidgetBuilder builder) => Kinject<T>(
        factory: factory,
        builder: builder,
      );
}
