part of 'fakes/fakes.dart';

/// A [UnlockdBluetoothProvider] which uses [Fake]s to mock any
/// Bluetooth behaviour.
class FakeBluetoothProvider extends UnlockdBluetoothProvider {
  /// Create a [FakeBluetoothProvider]
  ///
  /// you can pass in [adapterStateController] and [scanController]
  /// to control the state of the adapter and the scan results.
  FakeBluetoothProvider({
    StreamController<UnlockdBluetoothAdapterState>? adapterStateController,
    StreamController<List<UnlockdScanResult>>? scanController,
    bool isScanningNow = false,
  })  : _isScanningNow = isScanningNow,
        _adapterStateController =
            adapterStateController ?? StreamController.broadcast(),
        _scanController = scanController ?? StreamController.broadcast() {
    if (_isScanningNow) {
      _scanController.add([mothers.scanResult()]);
    }
  }

  final StreamController<UnlockdBluetoothAdapterState> _adapterStateController;
  final StreamController<List<UnlockdScanResult>> _scanController;
  final bool _isScanningNow;

  Stream<List<UnlockdScanResult>> get _scanStream => _scanController.stream;

  Stream<UnlockdBluetoothAdapterState> get _adapterStream =>
      _adapterStateController.stream;

  @override
  Future<void> close() async {
    await _adapterStateController.close();
    await _scanController.close();
  }

  @override
  Future<void> turnOn() async =>
      _adapterStateController.add(UnlockdBluetoothAdapterState.on);

  @override
  Future<void> turnOff() async =>
      _adapterStateController.add(UnlockdBluetoothAdapterState.off);

  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() => _adapterStream;

  @override
  bool isScanningNow() => _isScanningNow;

  @override
  Stream<bool> isScanning() {
    return _scanStream.map((event) => event.isNotEmpty);
  }

  @override
  Future<void> startScan({
    Duration? timeout,
    bool? androidUsesFineLocation,
    List<UnlockdGuid>? withServices,
    List<String>? withRemoteIds,
    List<String>? withNames,
    List<String>? withKeywords,
    List<UnlockdMsdFilter>? withMsd,
  }) async {}

  @override
  Future<void> stopScan() async {}

  @override
  Future<List<UnlockdBluetoothDevice>> systemDevices() async {
    return _scanStream.map((event) => event.map((e) => e.device).toList()).last;
  }

  @override
  Stream<List<UnlockdScanResult>> scanResults() {
    return _scanStream;
  }

  @override
  Stream<List<UnlockdScanResult>> onScanResults() {
    return _scanStream;
  }

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) {
    subscription.cancel();
  }

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) {
    return FakeBluetoothDevice(
      remoteId: remoteId,
      platformName: 'Fake Device',
    );
  }
}
