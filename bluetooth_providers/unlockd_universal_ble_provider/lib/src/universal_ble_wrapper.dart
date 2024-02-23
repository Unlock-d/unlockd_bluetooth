// ignore_for_file: avoid_setters_without_getters

part of 'universal_ble/universal_ble.dart';

/// This class is a wrapper for [UniversalBle]. We do this since most of the
/// methods provided by the library are static methods and we want to be able
/// to mock them in our tests.
abstract class UniversalBleWrapper {
  set onAvailabilityChange(OnAvailabilityChange? onAvailabilityChange);

  set onScanResult(OnScanResult? onScanResult);

  Future<void> startScan({
    WebRequestOptionsBuilder? webRequestOptions,
  });

  Future<void> stopScan();

  Future<bool> enableBluetooth();
}
