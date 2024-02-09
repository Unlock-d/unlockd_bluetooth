part of 'isar.dart';

/// A [UnlockdBluetoothDescriptor] implementation for Isar.
@Collection(inheritance: false)
class IsarBluetoothDescriptor extends UnlockdBluetoothDescriptor {
  Id id = Isar.autoIncrement;

  /// The contents of the descriptor.
  List<int> contents = [];

  /// The characteristic that this descriptor belongs to.
  @Backlink(to: 'isarDescriptors')
  final IsarLink<IsarBluetoothCharacteristic> characteristic = IsarLink();

  @override
  String descriptorUuid = '';

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
    final isar = IsarBluetoothProvider.instance._isar;
    await isar.writeTxn<void>(
      () => isar.isarBluetoothDescriptors.put(
        updatedDescriptor,
      ),
    );
  }
}
