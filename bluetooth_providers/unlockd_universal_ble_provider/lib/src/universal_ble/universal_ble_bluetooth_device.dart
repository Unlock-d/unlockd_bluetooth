part of 'universal_ble.dart';

/// [UnlockdBluetoothDevice] which uses [UniversalBle] to retrieve
/// Bluetooth information.
class UniversalBleBluetoothDevice extends UnlockdBluetoothDevice
    with EquatableMixin {
  UniversalBleBluetoothDevice._({
    required this.remoteId,
    String? name,
  }) : _name = name;

  /// Creates a [UniversalBleBluetoothDevice] from a scan result.
  factory UniversalBleBluetoothDevice.fromScanResult(BleScanResult scanResult) {
    return UniversalBleBluetoothDevice._(
      remoteId: scanResult.deviceId,
      name: scanResult.name,
    );
  }

  /// Creates a [UniversalBleBluetoothDevice] from a remote id.
  ///
  ///   - iOS uses 128-bit uuids the remoteId,
  ///   e.g. e006b3a7-ef7b-4980-a668-1f8005f84383
  ///   - Android uses 48-bit mac addresses as the remoteId,
  ///   e.g. 06:E5:28:3B:FD:E0
  factory UniversalBleBluetoothDevice.fromRemoteId(String remoteId) {
    return UniversalBleBluetoothDevice._(remoteId: remoteId);
  }

  final String? _name;

  @override
  final String remoteId;

  @override
  String get platformName => _name ?? 'unknown_adv_name';

  @override
  Future<void> connect({required Duration timeout, bool autoConnect = false}) {
    throw UnimplementedError();
  }

  @override
  Stream<UnlockdBluetoothConnectionState> get connectionState =>
      throw UnimplementedError();

  @override
  Future<void> disconnect() {
    throw UnimplementedError();
  }

  @override
  Future<List<UnlockdBluetoothService>> discoverServices() {
    throw UnimplementedError();
  }

  @override
  bool get isConnected => throw UnimplementedError();

  @override
  Stream<int> get mtu => throw UnimplementedError();

  @override
  int get mtuNow => throw UnimplementedError();

  @override
  Future<void> performUpdate(
    FirmwarePackage firmwarePackage, {
    required ProgressCallback onProgressChanged,
    DeviceCallback? onConnected,
    DeviceCallback? onConnecting,
    DeviceCallback? onDisconnected,
    DeviceCallback? onDisconnecting,
    DeviceCallback? onAborted,
    DeviceCallback? onCompleted,
    DeviceCallback? onProcessStarted,
    DeviceCallback? onProcessStarting,
    int timeout = 10,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<int> readRssi() {
    throw UnimplementedError();
  }

  @override
  Future<void> requestMtu(int mtu) {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> read(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<void> write(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid, {
    required Uint8List value,
  }) async {
    throw UnimplementedError();
  }

  @override
  Stream<Uint8List> subscribe(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) async* {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [remoteId];
}
