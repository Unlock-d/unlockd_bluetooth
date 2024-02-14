part of 'isar.dart';

/// A class representing a Bluetooth characteristic in Isar.
@Collection(inheritance: false)
class IsarBluetoothCharacteristic extends UnlockdBluetoothCharacteristic {
  Id id = Isar.autoIncrement;

  @Backlink(to: 'isarCharacteristics')
  final IsarLink<IsarBluetoothService> service = IsarLink();

  final IsarLinks<IsarBluetoothDescriptor> isarDescriptors = IsarLinks();

  /// The contents of the characteristic.
  List<int> contents = [];

  @override
  IsarCharacteristicProperties properties = IsarCharacteristicProperties();

  @override
  bool isNotifying = false;

  @override
  IsarGuid characteristicUuid = IsarGuid();

  @ignore
  @override
  Stream<List<int>> get onValueReceived => Stream.value(contents);

  @override
  List<int> get lastValue => contents;

  @ignore
  @override
  List<IsarBluetoothDescriptor> get descriptors => isarDescriptors.toList();

  @override
  Future<List<int>> read() async => contents;

  @override
  Future<void> write(List<int> value, {bool? withoutResponse}) async {
    final updatedChar = this..contents = value;

    await _writeChar(updatedChar);
  }

  @override
  Future<bool> setNotifyValue({required bool value}) async {
    final updatedChar = this..isNotifying = value;

    await _writeChar(updatedChar);
    return value;
  }

  Future<void> _writeChar(IsarBluetoothCharacteristic updatedChar) async {
    final isar = IsarBluetoothProvider.instance._isar;
    await isar.writeTxn<void>(
      () => isar.isarBluetoothCharacteristics.put(
        updatedChar,
      ),
    );
  }
}
