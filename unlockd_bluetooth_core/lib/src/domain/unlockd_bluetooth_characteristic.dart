part of 'domain.dart';

/// An abstract class representing a Bluetooth characteristic.
abstract class UnlockdBluetoothCharacteristic {
  /// Get Properties from known services
  UnlockdCharacteristicProperties get properties;

  /// return true if we're subscribed to this characteristic
  ///   -  you can subscribe using setNotifyValue(true)
  bool get isNotifying;

  /// Get Descriptors from known services
  List<UnlockdBluetoothDescriptor> get descriptors;

  /// Characteristic Bluetooth GUID
  UnlockdGuid get characteristicUuid;

  Stream<List<int>> get onValueReceived;

  List<int> get lastValue;

  /// Read a characteristic
  Future<List<int>> read();

  /// Writes a characteristic.
  ///  - [withoutResponse]: the write is not guaranteed and always returns immediately with success.
  ///  - [withResponse]: the write returns error on failure
  ///  - [allowLongWrite]: if set, larger writes > MTU are allowed (up to 512 bytes).
  ///       This should be used with caution.
  ///         1. it can only be used *with* response
  ///         2. the peripheral device must support the 'long write' ble protocol.
  ///         3. Interrupted transfers can leave the characteristic in a partially written state
  ///         4. If the mtu is small, it is very very slow.
  Future<void> write(List<int> value, {bool? withoutResponse});

  /// Sets notifications or indications for the characteristic.
  ///   - If a characteristic supports both notifications and indications,
  ///     we use notifications. This is a limitation of CoreBluetooth on iOS.
  Future<bool> setNotifyValue({required bool value});
}
