import 'dart:async';

import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

/// General controller of different Bluetooth providers.
class UnlockdBluetooth implements UnlockdBluetoothProvider {
  UnlockdBluetooth._(this._provider);

  /// Initializes the [UnlockdBluetooth] instance.
  /// When [shouldEmulate] is true, [emulationProvider] must be provided.
  factory UnlockdBluetooth.initialize({
    required UnlockdBluetoothProvider provider,
    UnlockdBluetoothProvider? emulationProvider,
    bool shouldEmulate = false,
  }) {
    assert(
      emulationProvider != null || !shouldEmulate,
      '$emulationProvider must be provided if $shouldEmulate is true',
    );

    _instance = UnlockdBluetooth._(
      shouldEmulate ? emulationProvider! : provider,
    );
    return instance;
  }

  /// Returns the [UnlockdBluetooth] instance.
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

  /// Returns a [UnlockdBluetoothDevice] from a [remoteId].
  static UnlockdBluetoothDevice fromProvider(String remoteId) =>
      instance.fromRemoteId(remoteId);

  @override
  Future<void> close() async => _provider.close();

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
    List<UnlockdGuid>? withServices,
    List<String>? withRemoteIds,
    List<String>? withNames,
    List<String>? withKeywords,
    List<UnlockdMsdFilter>? withMsd,
  }) =>
      _provider.startScan(
        timeout: timeout,
        androidUsesFineLocation: androidUsesFineLocation,
        withServices: withServices,
        withRemoteIds: withRemoteIds,
        withNames: withNames,
        withKeywords: withKeywords,
        withMsd: withMsd,
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
