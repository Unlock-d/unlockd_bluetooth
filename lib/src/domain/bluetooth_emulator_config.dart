import 'dart:async';

import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_adapter_state.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_device.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_scan_result.dart';

abstract class BluetoothEmulatorConfig {
  Future<void> turnOn();

  Future<void> turnOff();

  Stream<UnlockdBluetoothAdapterState> adapterState();

  FutureOr<bool> isScanningNow();

  Stream<bool> isScanning();

  Future<void> startScan({
    Duration? timeout,
    bool? androidUsesFineLocation,
    List<String>? withRemoteIds,
  });

  Future<void> stopScan();

  Future<List<UnlockdBluetoothDevice>> systemDevices();

  Stream<List<UnlockdScanResult>> scanResults();

  Stream<List<UnlockdScanResult>> onScanResults();

  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription);
}
