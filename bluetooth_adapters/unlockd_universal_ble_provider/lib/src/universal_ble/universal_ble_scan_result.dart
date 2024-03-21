part of 'universal_ble.dart';

/// [UniversalBleScanResult] which uses [BleScanResult] to retrieve
/// Bluetooth information.
class UniversalBleScanResult extends UnlockdScanResult with EquatableMixin {
  UniversalBleScanResult._(this._scanResult);

  /// Creates a [UniversalBleScanResult] from a [BleScanResult].
  factory UniversalBleScanResult.fromUniversalBle(BleScanResult scanResult) {
    return UniversalBleScanResult._(scanResult);
  }

  final BleScanResult _scanResult;

  @override
  UnlockdAdvertisementData get advertisementData => throw UnimplementedError();

  @override
  UnlockdBluetoothDevice get device =>
      UniversalBleBluetoothDevice.fromScanResult(_scanResult);

  @override
  int get rssi => throw UnimplementedError();

  @override
  List<Object?> get props => [device];
}
