import 'dart:async';

import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

/// The core controller which handles different [UnlockdBluetoothAdapter]s.
class UnlockdBluetoothController implements UnlockdBluetoothAdapter {
  UnlockdBluetoothController._(this._adapter);

  /// Initializes the [UnlockdBluetoothController] instance.
  /// When [shouldEmulate] is true, [emulationAdapter] must be provided.
  factory UnlockdBluetoothController.initialize({
    required UnlockdBluetoothAdapter adapter,
    UnlockdBluetoothAdapter? emulationAdapter,
    bool shouldEmulate = false,
  }) {
    assert(
      emulationAdapter != null || !shouldEmulate,
      '$emulationAdapter must be provided if $shouldEmulate is true',
    );

    _instance = UnlockdBluetoothController._(
      shouldEmulate ? emulationAdapter! : adapter,
    );
    return instance;
  }

  /// Returns the [UnlockdBluetoothController] instance.
  static UnlockdBluetoothController get instance {
    assert(
      _instance != null,
      '$UnlockdBluetoothController has not been initialized. '
      'Call ${UnlockdBluetoothController.initialize} first.',
    );
    return _instance!;
  }

  static UnlockdBluetoothController? _instance;
  final UnlockdBluetoothAdapter _adapter;

  /// Returns a [UnlockdBluetoothDevice] from a [remoteId].
  static UnlockdBluetoothDevice fromAdapter(String remoteId) =>
      instance.fromRemoteId(remoteId);

  @override
  Future<void> close() async => _adapter.close();

  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() =>
      _adapter.adapterState();

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) =>
      _adapter.cancelWhenScanComplete(subscription);

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) =>
      _adapter.fromRemoteId(remoteId);

  @override
  Stream<bool> isScanning() => _adapter.isScanning();

  @override
  bool isScanningNow() => _adapter.isScanningNow();

  @override
  Stream<List<UnlockdScanResult>> onScanResults() => _adapter.onScanResults();

  @override
  Stream<List<UnlockdScanResult>> scanResults() => _adapter.scanResults();

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
      _adapter.startScan(
        timeout: timeout,
        androidUsesFineLocation: androidUsesFineLocation,
        withServices: withServices,
        withRemoteIds: withRemoteIds,
        withNames: withNames,
        withKeywords: withKeywords,
        withMsd: withMsd,
      );

  @override
  Future<void> stopScan() => _adapter.stopScan();

  @override
  Future<List<UnlockdBluetoothDevice>> systemDevices() =>
      _adapter.systemDevices();

  @override
  Future<void> turnOff() => _adapter.turnOff();

  @override
  Future<void> turnOn() => _adapter.turnOn();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
}
