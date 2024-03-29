part of 'isar.dart';

/// A [UnlockdBluetoothDescriptor] implementation for Isar.
@Collection(inheritance: false)
class IsarBluetoothDescriptor extends UnlockdBluetoothDescriptor {
  /// Internal [Isar] id.
  Id id = Isar.autoIncrement;

  /// The contents of the descriptor.
  List<int> contents = [];

  /// [Backlink] to [IsarBluetoothCharacteristic].
  @Backlink(to: 'isarDescriptors')
  final IsarLink<IsarBluetoothCharacteristic> characteristic = IsarLink();

  @override
  IsarGuid descriptorUuid = IsarGuid();

  @override
  List<int> get lastValue => contents;

  @ignore
  @override
  Stream<List<int>> get onValueReceived => Stream.value(contents);

  @override
  Future<List<int>> read() async => contents;

  @override
  Future<void> write(List<int> value) async {
    final updatedDescriptor = this..contents = value;

    await _writeDescriptor(updatedDescriptor);
  }

  Future<void> _writeDescriptor(
    IsarBluetoothDescriptor updatedDescriptor,
  ) async {
    final isar = IsarBluetoothAdapter.instance._isar;
    await isar.writeTxn<void>(
      () => isar.isarBluetoothDescriptors.put(
        updatedDescriptor,
      ),
    );
  }
}
