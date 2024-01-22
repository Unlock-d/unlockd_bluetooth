import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unlockd_bluetooth/src/domain/bluetooth_emulator_config.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_adapter_state.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_device.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_scan_result.dart';
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
  }) async {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    await _instance._init(isar, isEmulator);
    return _instance;
  }

  Future<void> _init(Isar? isar, bool isEmulator) async {
    this.isar = isar;
    _emulatorConfig = isEmulator
        ? IsarBluetoothEmulatorConfig(isar ?? await _initIsar())
        : FbpBluetoothConfig.instance;
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
  }) =>
      _emulatorConfig.startScan(
        timeout: timeout,
        androidUsesFineLocation: androidUsesFineLocation,
      );

  Future<void> stopScan() => _emulatorConfig.stopScan();

  Future<List<UnlockdBluetoothDevice>> systemDevices() =>
      _emulatorConfig.systemDevices();

  Stream<List<UnlockdScanResult>> scanResults() =>
      _emulatorConfig.scanResults();

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
