import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

class UnlockdBluetooth implements UnlockdBluetoothProvider {
  UnlockdBluetooth._(this._provider, this._emulator);

  factory UnlockdBluetooth.initialize({
    required UnlockdBluetoothProvider provider,
    UnlockdBluetoothProvider? emulationProvider,
    bool shouldEmulate = false,
  }) {
    assert(
      emulationProvider != null || !shouldEmulate,
      '$emulationProvider must be provided if $shouldEmulate is true',
    );

    if (_instance == null) {
      _instance = UnlockdBluetooth._(
        provider,
        emulationProvider,
      );

      registerExtension('ext.bluetooth.getController', (method, parameters) async {
        return ServiceExtensionResponse.result(
          json.encode({
            'provider': instance._provider.runtimeType.toString(),
            'emulator': instance._emulator.runtimeType.toString(),
          }),
        );
      });
    }

    return instance;
  }

  static UnlockdBluetooth get instance {
    assert(
      _instance != null,
      '$UnlockdBluetooth has not been initialized. '
      'Call ${UnlockdBluetooth.initialize} first.',
    );
    return _instance!;
  }

  static UnlockdBluetooth? _instance;
  final UnlockdBluetoothProvider _provider;
  final UnlockdBluetoothProvider? _emulator;

  static UnlockdBluetoothDevice fromProvider(String remoteId) =>
      instance.fromRemoteId(remoteId);

  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() =>
      _provider.adapterState();

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) =>
      _provider.cancelWhenScanComplete(subscription);

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) =>
      _provider.fromRemoteId(remoteId);

  @override
  Stream<bool> isScanning() => _provider.isScanning();

  @override
  FutureOr<bool> isScanningNow() => _provider.isScanningNow();

  @override
  Stream<List<UnlockdScanResult>> onScanResults() => _provider.onScanResults();

  @override
  Stream<List<UnlockdScanResult>> scanResults() => _provider.scanResults();

  @override
  Future<void> startScan({
    Duration? timeout,
    bool? androidUsesFineLocation,
    List<String>? withRemoteIds,
  }) =>
      _provider.startScan(
        timeout: timeout,
        androidUsesFineLocation: androidUsesFineLocation,
        withRemoteIds: withRemoteIds,
      );

  @override
  Future<void> stopScan() => _provider.stopScan();

  @override
  Future<List<UnlockdBluetoothDevice>> systemDevices() =>
      _provider.systemDevices();

  @override
  Future<void> turnOff() => _provider.turnOff();

  @override
  Future<void> turnOn() => _provider.turnOn();
}
