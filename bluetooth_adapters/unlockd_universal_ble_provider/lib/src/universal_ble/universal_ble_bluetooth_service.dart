part of 'universal_ble.dart';

/// [UniversalBleBluetoothService] which uses [UniversalBle] to retrieve
/// Bluetooth information.
class UniversalBleBluetoothService extends UnlockdBluetoothService {
  UniversalBleBluetoothService._(
    this._service,
  );

  /// Creates a [UniversalBleBluetoothService] from a scan result.
  factory UniversalBleBluetoothService.fromUniversalBle(BleService service) {
    return UniversalBleBluetoothService._(service);
  }

  final BleService _service;

  @override
  List<UnlockdBluetoothCharacteristic> get characteristics =>
      throw UnimplementedError();

  @override
  UnlockdGuid get serviceUuid => UnlockdGuid.fromString(_service.uuid);
}
