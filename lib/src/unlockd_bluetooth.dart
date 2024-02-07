import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';
import 'package:unlockd_bluetooth/src/fbp/fbp_bluetooth_config.dart';
import 'package:unlockd_bluetooth/src/isar/isar.dart';

class UnlockdBluetooth {
  UnlockdBluetooth._();

  bool _initialized = false;
  Isar? isar;
  late BluetoothEmulatorConfig _emulatorConfig;

  static final UnlockdBluetooth _instance = UnlockdBluetooth._();

  static Future<UnlockdBluetooth> initialize({
    Isar? isar,
    bool isEmulator = false,
    Future<void> Function(Isar isar)? onInitializeEmulator,
  }) async {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    await _instance._init(isar, isEmulator, onInitializeEmulator);
    return _instance;
  }

  Future<void> _init(
    Isar? isar,
    bool isEmulator,
    Future<void> Function(Isar isar)? onInitializeEmulator,
  ) async {
    if (isEmulator) {
      this.isar = isar ?? await _initIsar();
      if (this.isar!.isarBluetoothConfigs.countSync() == 0) {
        await onInitializeEmulator?.call(this.isar!);
      }
      _emulatorConfig = IsarBluetoothEmulatorConfig(this.isar!);
    } else {
      _emulatorConfig = FbpBluetoothConfig.instance;
    }
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

  Future<Isar> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      unlockdBluetoothSchemas,
      directory: dir.path,
    );
  }
}
