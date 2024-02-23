part of 'universal_ble/universal_ble.dart';

/// A [UnlockdBluetoothProvider] which uses [UniversalBle]
/// to retrieve Bluetooth information.
class UniversalBleProvider extends UnlockdBluetoothProvider {
  UniversalBleProvider._();

  /// Initializes singleton instance of [UniversalBleProvider].
  factory UniversalBleProvider.initialize({
    UniversalBlePlatform? universalBle,
  }) {
    if (universalBle != null) {
      UniversalBle.setInstance(universalBle);
    }

    _instance = UniversalBleProvider._();
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

  StreamController<UnlockdBluetoothAdapterState>?
      _internalAdapterStateController;
  StreamController<List<UnlockdScanResult>>? _internalScanController;
  Timer? _stopScanTimer;
  ScanFilters? _scanFilters;

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
    UniversalBle.onAvailabilityChange = (state) {
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
    // TODO(PJ): implement connect
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
    // TODO(PJ): implement connect
    throw UnimplementedError();
  }

  @override
  Stream<List<UnlockdScanResult>> onScanResults() {
    final scans = StreamController<UnlockdScanResult>();
    final scanResults = <UnlockdScanResult>{};

    UniversalBle.onScanResult = (result) {
      scans.add(UniversalBleScanResult.fromUniversalBle(result));
    };

    scans.stream
        .where((result) => _scanFilters?.filter(result) ?? true)
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

    _scanFilters = ScanFilters(
      withServices: withServices,
      withRemoteIds: withRemoteIds,
      withNames: withNames,
      withKeywords: withKeywords,
      withMsd: withMsd,
    );

    return UniversalBle.startScan();
  }

  @override
  Future<void> stopScan() {
    UniversalBle.onScanResult = null;
    _scanController.close();
    _stopScanTimer?.cancel();

    return UniversalBle.stopScan();
  }

  @override
  Future<List<UnlockdBluetoothDevice>> systemDevices() {
    // TODO(PJ): implement connect
    throw UnimplementedError();
  }

  @override
  Future<void> turnOff() {
    // TODO(PJ): implement connect
    throw UnimplementedError();
  }

  @override
  Future<void> turnOn() => UniversalBle.enableBluetooth();
}
