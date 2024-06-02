import 'package:flutter/foundation.dart';
import 'package:kanza_di/kinject.dart';

final class AppKinjectObserver implements KinjectObserver {
  @override
  void onCreate(Kinject instance) {
    debugPrintThrottled('${instance.type} initialized');
  }

  @override
  void onDispose(Kinject instance) {
    debugPrintThrottled('${instance.type} disposed');
  }
}
