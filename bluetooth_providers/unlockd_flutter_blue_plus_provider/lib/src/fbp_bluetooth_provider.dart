import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_flutter_blue_plus_provider/src/fbp/fbp.dart';

class FbpBluetoothProvider extends UnlockdBluetoothProvider {
  FbpBluetoothProvider._();

  static final FbpBluetoothProvider instance = FbpBluetoothProvider._();

  @override
  Future<void> turnOn() => FlutterBluePlus.turnOn();

  @override
  Future<void> turnOff() => FlutterBluePlus.turnOff();

  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() {
    return FlutterBluePlus.adapterState.map(
      (event) => switch (event) {
        BluetoothAdapterState.unknown => UnlockdBluetoothAdapterState.unknown,
        BluetoothAdapterState.unavailable =>
          UnlockdBluetoothAdapterState.unavailable,
        BluetoothAdapterState.unauthorized =>
          UnlockdBluetoothAdapterState.unauthorized,
        BluetoothAdapterState.turningOn =>
          UnlockdBluetoothAdapterState.turningOn,
        BluetoothAdapterState.on => UnlockdBluetoothAdapterState.on,
        BluetoothAdapterState.turningOff =>
          UnlockdBluetoothAdapterState.turningOff,
        BluetoothAdapterState.off => UnlockdBluetoothAdapterState.off,
      },
    );
  }

  @override
  FutureOr<bool> isScanningNow() => FlutterBluePlus.isScanningNow;

  @override
  Stream<bool> isScanning() => FlutterBluePlus.isScanning;

  @override
  Future<void> startScan({
    Duration? timeout,
    bool? androidUsesFineLocation,
    List<String>? withRemoteIds,
  }) =>
      FlutterBluePlus.startScan(
        timeout: timeout,
        androidUsesFineLocation: androidUsesFineLocation ?? false,
        withRemoteIds: withRemoteIds ?? const [],
      );

  @override
  Future<void> stopScan() => FlutterBluePlus.stopScan();

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) =>
      FbpBluetoothDevice.fromRemoteId(remoteId);

  @override
  Future<List<UnlockdBluetoothDevice>> systemDevices() =>
      FlutterBluePlus.systemDevices
          .then((list) => list.map(FbpBluetoothDevice.fromFbp).toList());

  @override
  Stream<List<UnlockdScanResult>> scanResults() => FlutterBluePlus.scanResults
      .map((list) => list.map(FbpScanResult.fromFbp).toList());

  @override
  Stream<List<UnlockdScanResult>> onScanResults() =>
      FlutterBluePlus.onScanResults
          .map((list) => list.map(FbpScanResult.fromFbp).toList());

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) =>
      FlutterBluePlus.cancelWhenScanComplete(subscription);
}
