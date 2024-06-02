import 'kinject.dart';

/// Interface for observers to configure based on your project needs
abstract interface class KinjectObserver {
  /// called when new instance created in the widget tree
  void onCreate(Kinject<dynamic> instance);

  /// called when instance removed from the widget tree
  void onDispose(Kinject<dynamic> instance);
}
