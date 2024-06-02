import 'package:flutter/widgets.dart';

import 'disposable.dart';
import 'kinject_observer.dart';
import 'provider.dart';

/// {@template kinject}
/// Widget which provides instance within [factory] callback and
/// maintains its dispose state
/// {@endtemplate}
class Kinject<T> extends StatefulWidget {
  /// {@macro kinject}
  const Kinject({
    super.key,
    required this.builder,
    required this.factory,
  });

  /// A builder method that returns child widget
  final WidgetBuilder builder;

  /// The method which will return the instance for widget tree
  final T Function(BuildContext) factory;

  /// Simple observer to track states of instances
  static KinjectObserver? observer;

  /// type of current instance
  dynamic get type => T;

  /// The [State] factory of this [StatefulWidget]
  @override
  State<Kinject<T>> createState() => _KinjectState<T>();
}

class _KinjectState<T> extends State<Kinject<T>> {
  /// The instance that will be provided for widget tree
  T? instance;

  @override
  Widget build(BuildContext context) {
    return Provider(
      instance: getInstance(),
      child: Builder(
        builder: (context) {
          return widget.builder(context);
        },
      ),
    );
  }

  T getInstance() {
    if (instance == null) {
      instance = widget.factory(context);
      Kinject.observer?.onCreate(widget);
    }

    return instance!;
  }

  @override
  void dispose() {
    if (instance is Disposable) {
      (instance as Disposable?)?.dispose();
    }

    Kinject.observer?.onDispose(widget);
    super.dispose();
  }
}
