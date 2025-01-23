import 'package:flutter/widgets.dart';

import '../kinject.dart';

/// module provider with more elegant syntax
/// it de-couples multi-instance process of module seperately
abstract class KinjectModule extends StatefulWidget {
  const KinjectModule({super.key});

  /// list of binds to be provided by module
  List<ProxyKinject<dynamic>> binds(BuildContext context);

  /// child widget to be wrapped by module
  Widget child(BuildContext context);

  @override
  State<KinjectModule> createState() => _KinjectModuleState();
}

class _KinjectModuleState extends State<KinjectModule> {
  List<ProxyKinject<dynamic>>? _binds;

  @override
  void initState() {
    super.initState();
    _binds = widget.binds(context);
  }

  @override
  Widget build(BuildContext context) {
    return Kinjects(
      builder: widget.child,
      kinjects: _binds!,
    );
  }

  @override
  void dispose() {
    _binds = null;
    super.dispose();
  }
}
