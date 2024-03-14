part of 'domain.dart';

/// Additional metadata about a characteristic
abstract class UnlockdBluetoothDescriptor {
  /// The UUID of the descriptor
  UnlockdGuid get descriptorUuid;

  /// The value of the descriptor
  Stream<List<int>> get onValueReceived;

  /// The last value of the descriptor
  List<int> get lastValue;

  /// Retrieves the value of a specified descriptor
  Future<List<int>> read();

  /// Writes the value of a descriptor
  Future<void> write(List<int> value);
}
