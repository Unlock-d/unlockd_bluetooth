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

    final bluetoothStorage = UnlockdBluetooth.instance.bluetoothStorage;
    if (bluetoothStorage != null && bluetoothStorage is IsarBluetoothStorage) {
      await bluetoothStorage.isar.writeTxn(
        () => bluetoothStorage.isar.isarBluetoothDescriptors.put(
          updatedDescriptor,
        ),
      );
    }
  }
}
