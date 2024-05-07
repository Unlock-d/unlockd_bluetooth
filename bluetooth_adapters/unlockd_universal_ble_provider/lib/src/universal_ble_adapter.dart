part of 'universal_ble/universal_ble.dart';

/// A [UnlockdBluetoothAdapter] which uses [UniversalBle]
/// to retrieve Bluetooth information.
class UniversalBleAdapter extends UnlockdBluetoothAdapter {
  UniversalBleAdapter._();

  /// Initializes singleton instance of [UniversalBleAdapter].
  factory UniversalBleAdapter.initialize({
    UniversalBlePlatform? universalBle,
  }) {
    if (universalBle != null) {
      UniversalBle.setInstance(universalBle);
    }

    _instance = UniversalBleAdapter._();
    return _instance!;
  }

  @override
  String get name => 'universal_ble';

  /// Returns the [UniversalBleAdapter] instance.
  /// Throws an [AssertionError] if [UniversalBleAdapter.initialize] has
  /// not been called.
  static UniversalBleAdapter get instance {
    assert(
      _instance != null,
      '$UniversalBleAdapter has not been initialized. '
      'Call ${UniversalBleAdapter.initialize} first.',
    );
    return _instance!;
  }

  static UniversalBleAdapter? _instance;

  StreamController<UnlockdBluetoothAdapterState>?
      _internalAdapterStateController;
  StreamController<List<UnlockdScanResult>>? _internalScanResultController;
  StreamController<bool>? _internalScanningController;

  Timer? _stopScanTimer;
  ScanFilters? _scanFilters;
  var _internalIsScanning = false;

  bool get _isScanning => _internalIsScanning;

  set _isScanning(bool value) {
    _internalIsScanning = value;
    _scanningController.add(value);
  }

  StreamController<UnlockdBluetoothAdapterState> get _adapterStateController {
    if (_internalAdapterStateController == null ||
        _internalAdapterStateController!.isClosed) {
      _internalAdapterStateController = StreamController.broadcast();
    }
    return _internalAdapterStateController!;
  }

  StreamController<bool> get _scanningController {
    if (_internalScanningController == null ||
        _internalScanningController!.isClosed) {
      _internalScanningController = StreamController.broadcast();
    }
    return _internalScanningController!;
  }

  StreamController<List<UnlockdScanResult>> get _scanResultController {
    if (_internalScanResultController == null ||
        _internalScanResultController!.isClosed) {
      _internalScanResultController = StreamController.broadcast();
    }
    return _internalScanResultController!;
  }

  @override
  Future<void> close() async {
    await _internalAdapterStateController?.close();
    await _internalScanResultController?.close();
    await _internalScanningController?.close();
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
    return _scanningController.stream.startWith(isScanningNow);
  }

  @override
  bool get isScanningNow => _isScanning;

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
        .listen((event) => _scanResultController.add(event.toList()));

    return _scanResultController.stream;
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
    if (timeout != null) {
      _stopScanTimer = Timer(timeout, stopScan);
    }

    if (isScanningNow) {
      await stopScan();
    }

    _scanFilters = ScanFilters(
      withServices: withServices,
      withRemoteIds: withRemoteIds,
      withNames: withNames,
      withKeywords: withKeywords,
      withMsd: withMsd,
    );

    await UniversalBle.startScan();
    _isScanning = true;
  }

  @override
  Future<void> stopScan() async {
    UniversalBle.onScanResult = null;
    await _scanResultController.close();
    _stopScanTimer?.cancel();

    await UniversalBle.stopScan();
    _isScanning = false;
  }

  @override
  Future<List<UnlockdBluetoothDevice>> get systemDevices {
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
