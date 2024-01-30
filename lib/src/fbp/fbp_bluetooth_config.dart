import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth/src/domain/bluetooth_emulator_config.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_adapter_state.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_device.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_scan_result.dart';
import 'package:unlockd_bluetooth/src/fbp/fbp_bluetooth_device.dart';
import 'package:unlockd_bluetooth/src/fbp/fbp_scan_result.dart';

class FbpBluetoothConfig extends BluetoothEmulatorConfig {
  FbpBluetoothConfig._();

  static final FbpBluetoothConfig instance = FbpBluetoothConfig._();

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
