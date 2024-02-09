import 'dart:async';

import 'package:unlockd_bluetooth_core/src/domain/domain.dart';

abstract class UnlockdBluetoothProvider {
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

  UnlockdBluetoothDevice fromRemoteId(String remoteId);

  Future<List<UnlockdBluetoothDevice>> systemDevices();

  Stream<List<UnlockdScanResult>> scanResults();

  Stream<List<UnlockdScanResult>> onScanResults();

  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription);
}
