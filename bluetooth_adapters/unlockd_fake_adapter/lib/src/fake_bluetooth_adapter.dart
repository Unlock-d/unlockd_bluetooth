part of 'fakes/fakes.dart';

/// A [UnlockdBluetoothAdapter] which uses [Fake]s to mock any
/// Bluetooth behaviour.
class FakeBluetoothAdapter extends UnlockdBluetoothAdapter {
  /// Create a [FakeBluetoothAdapter]
  ///
  /// you can use the [adapterStateController] and [scanController]
  /// to control the state of the adapter and the scan results.
  FakeBluetoothAdapter({
    bool isScanningNow = false,
  })  : _isScanningNow = isScanningNow,
        adapterStateController = StreamController.broadcast(),
        isScanningController = StreamController.broadcast(),
        scanController = StreamController.broadcast();

  /// A [StreamController] to manipulate the adapter state.
  final StreamController<UnlockdBluetoothAdapterState> adapterStateController;

  /// A [StreamController] to manipulate the scan results.
  final StreamController<List<UnlockdScanResult>> scanController;

  /// A [StreamController] to manipulate the current isScanning state
  final StreamController<bool> isScanningController;

  Timer? _scanTimer;
  bool _isScanningNow;
  final _subscriptionsToCancel = <StreamSubscription<dynamic>>[];

  @override
  String get name => 'fake_bluetooth_adapter';

  @override
  Future<void> close() async {
    await adapterStateController.close();
    await scanController.close();
    await isScanningController.close();
    _scanTimer?.cancel();
  }

  @override
  Future<void> turnOn() async =>
      adapterStateController.add(UnlockdBluetoothAdapterState.on);

  @override
  Future<void> turnOff() async =>
      adapterStateController.add(UnlockdBluetoothAdapterState.off);

  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() =>
      adapterStateController.stream;

  @override
  bool get isScanningNow => _isScanningNow;

  set isScanningNow(bool value) {
    if (!isScanningController.isClosed) {
      isScanningController.add(value);
    }
    _isScanningNow = value;
  }

  @override
  Stream<bool> isScanning() {
    return isScanningController.stream;
  }

  @override
  Future<void> startScan({
    Duration? timeout,
    Duration? removeAfter,
    bool? androidUsesFineLocation,
    List<UnlockdGuid>? withServices,
    List<String>? withRemoteIds,
    List<String>? withNames,
    List<String>? withKeywords,
    List<UnlockdMsdFilter>? withMsd,
  }) async {
    isScanningNow = true;

    if (timeout != null) {
      _scanTimer = Timer(timeout, stopScan);
    }
  }

  @override
  Future<void> stopScan() async {
    isScanningNow = false;

    for (final subscription in _subscriptionsToCancel) {
      await subscription.cancel();
    }

    if (_scanTimer != null && _scanTimer!.isActive) {
      _scanTimer!.cancel();
    }
  }

  @override
  Future<List<UnlockdBluetoothDevice>> get systemDevices async {
    return scanController.stream
        .map((event) => event.map((e) => e.device).toList())
        .last;
  }

  @override
  Stream<List<UnlockdScanResult>> scanResults() {
    return scanController.stream;
  }

  @override
  Stream<List<UnlockdScanResult>> onScanResults() {
    return scanController.stream;
  }

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) {
    _subscriptionsToCancel.add(subscription);
  }

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) {
    return FakeBluetoothDevice(
      remoteId: remoteId,
      platformName: 'Fake Device',
    );
  }
}
