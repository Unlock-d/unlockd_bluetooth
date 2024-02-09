import 'dart:async';

import 'package:unlockd_bluetooth_core/src/domain/domain.dart';

class UnlockdBluetooth {
  UnlockdBluetooth._();

  bool _initialized = false;
  UnlockdBluetoothStorage? bluetoothStorage;
  late BluetoothEmulatorConfig _emulatorConfig;

  static final UnlockdBluetooth _instance = UnlockdBluetooth._();

  static Future<UnlockdBluetooth> initialize({
    required UnlockdBluetoothStorage bluetoothStorage,
    required Future<BluetoothEmulatorConfig> Function(
      UnlockdBluetoothStorage bluetoothStorage,
    ) onInitializeEmulator,
  }) async {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    await _instance._init(bluetoothStorage, onInitializeEmulator);
    return _instance;
  }

  Future<void> _init(
    UnlockdBluetoothStorage bluetoothStorage,
    Future<BluetoothEmulatorConfig> Function(
      UnlockdBluetoothStorage bluetoothStorage,
    ) onInitializeEmulator,
  ) async {
    _emulatorConfig = await onInitializeEmulator.call(bluetoothStorage);
    _initialized = true;
  }

  Future<void> turnOn() => _emulatorConfig.turnOn();

  Future<void> turnOff() => _emulatorConfig.turnOff();

  Stream<UnlockdBluetoothAdapterState> adapterState() =>
      _emulatorConfig.adapterState();

  FutureOr<bool> isScanningNow() async => _emulatorConfig.isScanningNow();

  Stream<bool> isScanning() => _emulatorConfig.isScanning();

  Future<void> startScan({
    Duration? timeout,
    bool? androidUsesFineLocation,
    List<String>? withRemoteIds,
  }) =>
      _emulatorConfig.startScan(
        timeout: timeout,
        androidUsesFineLocation: androidUsesFineLocation,
        withRemoteIds: withRemoteIds,
      );

  Future<void> stopScan() => _emulatorConfig.stopScan();

  static UnlockdBluetoothDevice fromRemoteId(String remoteId) =>
      _instance._emulatorConfig.fromRemoteId(remoteId);

  Future<List<UnlockdBluetoothDevice>> systemDevices() =>
      _emulatorConfig.systemDevices();

  Stream<List<UnlockdScanResult>> scanResults() =>
      _emulatorConfig.scanResults();

  Stream<List<UnlockdScanResult>> onScanResults() =>
      _emulatorConfig.onScanResults();

  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) =>
      _emulatorConfig.cancelWhenScanComplete(subscription);

  static UnlockdBluetooth get instance {
    assert(
      _instance._initialized,
      'You must initialize the UnlockdBluetooth instance '
      'before calling UnlockdBluetooth.instance',
    );
    return _instance;
  }
}
