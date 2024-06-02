import 'package:flutter/widgets.dart';

import 'proxy_kinject.dart';

/// {@template kinjects}
/// Widget which provides multiple instances and handles
/// their inter-dependencies
/// {@endtemplate}
class Kinjects extends StatefulWidget {
  /// {@macro kinjects}
  const Kinjects({
    super.key,
    required this.builder,
    required this.kinjects,
  });

  /// A builder method that returns your child widget
  final WidgetBuilder builder;

  /// The [ProxyKinject] list that contains instances
  final List<ProxyKinject<dynamic>> kinjects;

  @override
  State<Kinjects> createState() => _KinjectsState();
}

class _KinjectsState extends State<Kinjects> {
  /// Widget which holds all instances and their inter-dependencies
  WidgetBuilder? builder;

  @override
  void initState() {
    super.initState();

    final length = widget.kinjects.length;
    builder = widget.builder;

    for (var i = length - 1; i >= 0; i--) {
      final previousBuilder = builder;

      builder = (context) {
        return widget.kinjects[i].inject(previousBuilder!);
      };
    }
  }

  @override
  Widget build(BuildContext context) => builder!(context);
}
