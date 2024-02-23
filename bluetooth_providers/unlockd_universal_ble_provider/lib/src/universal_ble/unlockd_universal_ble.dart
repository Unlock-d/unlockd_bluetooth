// ignore_for_file: avoid_setters_without_getters

part of 'universal_ble.dart';

/// This class is a wrapper for [UniversalBle]. We do this since most of the
/// methods provided by the library are static methods and we want to be able
/// to mock them in our tests.
class UnlockdUniversalBle extends UniversalBleWrapper {
  UnlockdUniversalBle._();

  /// Returns the [UnlockdUniversalBle] instance.
  static final UnlockdUniversalBle instance = UnlockdUniversalBle._();

  @override
  set onAvailabilityChange(OnAvailabilityChange? onAvailabilityChange) {
    UniversalBle.onAvailabilityChange = onAvailabilityChange;
  }

  @override
  set onScanResult(OnScanResult? onScanResult) {
    UniversalBle.onScanResult = onScanResult;
  }

  @override
  Future<void> startScan({
    WebRequestOptionsBuilder? webRequestOptions,
  }) =>
      UniversalBle.startScan(webRequestOptions: webRequestOptions);

  @override
  Future<void> stopScan() => UniversalBle.stopScan();

  @override
  Future<bool> enableBluetooth() => UniversalBle.enableBluetooth();
}
