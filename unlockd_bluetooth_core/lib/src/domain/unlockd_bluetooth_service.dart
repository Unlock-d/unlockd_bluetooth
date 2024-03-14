part of 'domain.dart';

/// A Bluetooth service.
abstract class UnlockdBluetoothService {
  /// The characteristics of the service.
  List<UnlockdBluetoothCharacteristic> get characteristics;

  /// The UUID of the service.
  UnlockdGuid get serviceUuid;
}
