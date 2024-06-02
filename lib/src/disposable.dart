/// {@template disposable}
/// Interface for instance that should be disposed its fields
/// {@endtemplate}
abstract interface class Disposable {
  /// function which will be called to dispose fields of [Disposable] instance.
  ///
  /// subclass should implement this class and its [dispose] function to
  /// configure auto-dispose process.
  void dispose();
}
