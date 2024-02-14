part of 'domain.dart';

abstract class UnlockdBluetoothDescriptor {
  UnlockdGuid get descriptorUuid;

  Stream<List<int>> get onValueReceived;

  List<int> get lastValue;

  /// Retrieves the value of a specified descriptor
  Future<List<int>> read();

  /// Writes the value of a descriptor
  Future<void> write(List<int> value);
}
