part of 'universal_ble/universal_ble.dart';

/// A [UnlockdBluetoothProvider] which uses [UniversalBle]
/// to retrieve Bluetooth information.
class UniversalBleProvider extends UnlockdBluetoothProvider {
  UniversalBleProvider._(this._bleWrapper);

  /// Initializes singleton instance of [UniversalBleProvider].
  factory UniversalBleProvider.initialize({
    UniversalBleWrapper? wrapper,
  }) {
    _instance = UniversalBleProvider._(wrapper ?? UnlockdUniversalBle.instance);
    return _instance!;
  }

  /// Returns the [UniversalBleProvider] instance.
  /// Throws an [AssertionError] if [UniversalBleProvider.initialize] has
  /// not been called.
  static UniversalBleProvider get instance {
    assert(
      _instance != null,
      '$UniversalBleProvider has not been initialized. '
      'Call ${UniversalBleProvider.initialize} first.',
    );
    return _instance!;
  }

  static UniversalBleProvider? _instance;
  final UniversalBleWrapper _bleWrapper;

  StreamController<UnlockdBluetoothAdapterState>?
      _internalAdapterStateController;
  StreamController<List<UnlockdScanResult>>? _internalScanController;
  Timer? _stopScanTimer;

  StreamController<UnlockdBluetoothAdapterState> get _adapterStateController {
    if (_internalAdapterStateController == null ||
        _internalAdapterStateController!.isClosed) {
      _internalAdapterStateController = StreamController.broadcast();
    }
    return _internalAdapterStateController!;
  }

  StreamController<List<UnlockdScanResult>> get _scanController {
    if (_internalScanController == null || _internalScanController!.isClosed) {
      _internalScanController = StreamController.broadcast(sync: true);
    }
    return _internalScanController!;
  }

  @override
  Future<void> close() async {
    await _internalAdapterStateController?.close();
    await _internalScanController?.close();
    _stopScanTimer?.cancel();
  }

  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() {
    _bleWrapper.onAvailabilityChange = (state) {
      _adapterStateController.add(_availabilityToAdapterState(state));
    };

    return _adapterStateController.stream;
  }

  UnlockdBluetoothAdapterState _availabilityToAdapterState(
    AvailabilityState state,
  ) {
    return switch (state) {
      AvailabilityState.unknown => UnlockdBluetoothAdapterState.unknown,
      AvailabilityState.resetting => UnlockdBluetoothAdapterState.unavailable,
      AvailabilityState.unsupported => UnlockdBluetoothAdapterState.unavailable,
      AvailabilityState.unauthorized =>
        UnlockdBluetoothAdapterState.unauthorized,
      AvailabilityState.poweredOff => UnlockdBluetoothAdapterState.off,
      AvailabilityState.poweredOn => UnlockdBluetoothAdapterState.on,
    };
  }

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) {
    throw UnimplementedError();
  }

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) {
    return UniversalBleBluetoothDevice.fromRemoteId(remoteId);
  }

  @override
  Stream<bool> isScanning() {
    return _scanController.stream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(true);
        },
        handleDone: (sink) {
          sink
            ..add(false)
            ..close();
        },
      ),
    );
  }

  @override
  bool isScanningNow() => !_scanController.isClosed;

  @override
  Stream<List<UnlockdScanResult>> scanResults() {
    throw UnimplementedError();
  }

  @override
  Stream<List<UnlockdScanResult>> onScanResults() {
    final scans = StreamController<UnlockdScanResult>();
    final scanResults = <UnlockdScanResult>{};

    _bleWrapper.onScanResult = (result) {
      scans.add(UniversalBleScanResult.fromUniversalBle(result));
    };

    scans.stream
        .debounceBuffer(const Duration(milliseconds: 200))
        .map((results) => scanResults..addAll(results))
        .listen((event) => _scanController.add(event.toList()));

    return _scanController.stream;
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
  }) async {
    if (timeout != null) {
      _stopScanTimer = Timer(timeout, stopScan);
    }

    return _bleWrapper.startScan();
  }

  @override
  Future<void> stopScan() {
    _bleWrapper.onScanResult = null;
    _scanController.close();
    _stopScanTimer?.cancel();

    return _bleWrapper.stopScan();
  }

  @override
  Future<List<UnlockdBluetoothDevice>> systemDevices() {
    throw UnimplementedError();
  }

  @override
  Future<void> turnOff() {
    throw UnimplementedError();
  }

  @override
  Future<void> turnOn() => _bleWrapper.enableBluetooth();
}
