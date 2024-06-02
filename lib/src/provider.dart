import 'package:flutter/widgets.dart';

/// {@template provider}
/// Simple provider based on [InheritedWidget] to provide instance
/// along subtree
/// {@endtemplate}
class Provider<T> extends InheritedWidget {
  /// {@macro provider}
  const Provider({
    super.key,
    required super.child,
    required this.instance,
  });

  /// instance which will be provider in the tree
  final T instance;

  /// returns near instance by its type in the widget tree
  /// if there is not instance in the tree, it will return null.
  static T? resolve<T>(BuildContext context) {
    final injected = context.getInheritedWidgetOfExactType<Provider<T>>();
    return injected?.instance;
  }

  /// it will ignore update of widget tree when any changes occurred
  /// in provider.
  ///
  /// [Provider] will be used to inject instances as singleton or factory
  /// to widget tree. It shouldn't handle update process of any instance
  /// based on other instance.
  @override
  bool updateShouldNotify(Provider<T> oldWidget) => false;
}
