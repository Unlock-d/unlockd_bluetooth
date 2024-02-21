import 'dart:async';

import 'package:universal_ble/universal_ble.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

/// A [UnlockdBluetoothProvider] which uses [UniversalBle]
/// to retrieve Bluetooth information.
class UniversalBleProvider extends UnlockdBluetoothProvider {
  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() {
    throw UnimplementedError();
  }

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) {
    throw UnimplementedError();
  }

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) {
    throw UnimplementedError();
  }

  @override
  Stream<bool> isScanning() {
    throw UnimplementedError();
  }

  @override
  FutureOr<bool> isScanningNow() {
    throw UnimplementedError();
  }

  @override
  Stream<List<UnlockdScanResult>> onScanResults() {
    throw UnimplementedError();
  }

  @override
  Stream<List<UnlockdScanResult>> scanResults() {
    throw UnimplementedError();
  }

  @override
  Future<void> startScan({
    Duration? timeout,
    bool? androidUsesFineLocation,
    List<UnlockdGuid>? withServices,
    List<String>? withRemoteIds,
    List<String>? withNames,
    List<String>? withKeywords,
    List<UnlockdMsdFilter>? withMsd,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> stopScan() {
    throw UnimplementedError();
  }

  @override
  Future<List<UnlockdBluetoothDevice>> systemDevices() {
    throw UnimplementedError();
  }

  @override
  Future<void> turnOff() {
    throw UnimplementedError();
  }

  @override
  Future<void> turnOn() {
    throw UnimplementedError();
  }
}
