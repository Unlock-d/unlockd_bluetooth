/// This class is used to check if the platform is web or not.
abstract final class UnlockdBluetoothHelper {
  /// This is used to check if the platform is web or not.
  static const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

  /// This is used to check if the platform is test or not.
  static const bool kIsTest = bool.fromEnvironment('dart.library.io');
}
