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

  /// This stream emits values:
  ///   - anytime `read()` is called
  ///   - anytime a notification arrives (if subscribed)
  Stream<Uint8List> get onValueReceived;

  /// this variable is updated:
  ///   - anytime `read()` is called
  ///   - anytime `write()` is called
  ///   - anytime a notification arrives (if subscribed)
  ///   - when the device is disconnected it is cleared
  List<int> get lastValue;

  /// Read a characteristic
  Future<Uint8List> read();

  /// Writes a characteristic.
  ///  - [withoutResponse]: the write is not guaranteed and
  ///  always returns immediately with success.
  Future<void> write(Uint8List value, {bool? withoutResponse});

  /// Sets notifications or indications for the characteristic.
  ///   - If a characteristic supports both notifications and indications,
  ///     we use notifications. This is a limitation of CoreBluetooth on iOS.
  Future<bool> setNotifyValue({required bool value});
}
