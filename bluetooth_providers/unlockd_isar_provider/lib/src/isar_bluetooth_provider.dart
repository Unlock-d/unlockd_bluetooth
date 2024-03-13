part of 'isar/isar.dart';

/// A [UnlockdBluetoothProvider] which uses [Isar] as the underlying storage.
class IsarBluetoothProvider extends UnlockdBluetoothProvider {
  IsarBluetoothProvider._(this._isar);

  /// Returns the singleton instance of [IsarBluetoothProvider].
  static Future<IsarBluetoothProvider> initialize({
    required Isar isar,
    required Future<void> Function(Isar) initialize,
  }) async {
    _instance = IsarBluetoothProvider._(isar);

    if (isar.isarBluetoothConfigs.countSync() == 0) {
      await initialize(isar);
    }

    return _instance!;
  }

  /// Returns the [IsarBluetoothProvider] instance.
  /// Throws an [AssertionError] if [initialize] has not been called.
  static IsarBluetoothProvider get instance {
    assert(
      _instance != null,
      '$IsarBluetoothProvider has not been initialized. '
      'Call $initialize first.',
    );
    return _instance!;
  }

  static IsarBluetoothProvider? _instance;
  final Isar _isar;

  @override
  Future<void> close() async => _isar.close();

  @override
  Future<void> turnOn() async {
    await _changeConfig(
      (config) => config..adapterState = UnlockdBluetoothAdapterState.turningOn,
    );
    await Future<void>.delayed(const Duration(seconds: 2));
    await _changeConfig(
      (config) => config..adapterState = UnlockdBluetoothAdapterState.on,
    );
  }

  @override
  Future<void> turnOff() async {
    await _changeConfig(
      (config) =>
          config..adapterState = UnlockdBluetoothAdapterState.turningOff,
    );
    await Future<void>.delayed(const Duration(seconds: 2));
    await _changeConfig(
      (config) => config..adapterState = UnlockdBluetoothAdapterState.off,
    );
  }

  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() =>
      _configStream.map((config) => config.adapterState);

  @override
  bool isScanningNow() => _configSync.isScanningNow;

  @override
  Stream<bool> isScanning() =>
      _configStream.map((config) => config.isScanningNow);

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
    await _changeConfig((config) => config..isScanningNow = true);

    if (timeout != null) {
      await Future<void>.delayed(timeout);
      await _changeConfig((config) => config..isScanningNow = false);
    }
  }

  @override
  Future<void> stopScan() =>
      _changeConfig((config) => config..isScanningNow = false);

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) =>
      (_isar.isarBluetoothConfigs.getSync(isarBluetoothConfigId) ??
              IsarBluetoothConfig())
          .systemDevices
          .firstWhere((element) => element.remoteId == remoteId);

  @override
  Future<List<UnlockdBluetoothDevice>> systemDevices() async =>
      (await _config).systemDevices.toList();

  @override
  Stream<List<UnlockdScanResult>> scanResults() {
    return _configStream.map((config) => config.scanResults.toList());
  }

  @override
  Stream<List<UnlockdScanResult>> onScanResults() {
    return _configStream.map((config) => config.scanResults.toList());
  }

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) {
    _configStream
        .where((event) => event.isScanningNow == false)
        .listen((event) {
      subscription.cancel();
    });
  }

  Future<IsarBluetoothConfig> get _config async =>
      (await _isar.isarBluetoothConfigs.get(isarBluetoothConfigId)) ??
      IsarBluetoothConfig();

  IsarBluetoothConfig get _configSync =>
      (_isar.isarBluetoothConfigs.getSync(isarBluetoothConfigId)) ??
      IsarBluetoothConfig();

  Stream<IsarBluetoothConfig> get _configStream => _isar.isarBluetoothConfigs
      .watchObject(isarBluetoothConfigId, fireImmediately: true)
      .map((config) => config ?? IsarBluetoothConfig());

  Future<void> _changeConfig(
    IsarBluetoothConfig Function(IsarBluetoothConfig config) change,
  ) async {
    await _isar.writeTxn(() async {
      await _config.then((config) {
        return change(config);
      }).then((config) async {
        await _isar.isarBluetoothConfigs.put(config);
      });
    });
  }

  @override
  String get name => 'Isar adapter';
}
