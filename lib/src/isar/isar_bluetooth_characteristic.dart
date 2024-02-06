part of 'isar.dart';

@Collection(inheritance: false)
class IsarBluetoothCharacteristic extends UnlockdBluetoothCharacteristic {
  Id id = Isar.autoIncrement;

  @Backlink(to: 'isarCharacteristics')
  final IsarLink<IsarBluetoothService> service = IsarLink();

  final IsarLinks<IsarBluetoothDescriptor> isarDescriptors = IsarLinks();

  List<int> contents = [];

  @override
  IsarCharacteristicProperties properties = IsarCharacteristicProperties();

  @override
  bool isNotifying = false;

  @override
  String characteristicUuid = '';

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

    final isar = UnlockdBluetooth.instance.isar;
    if (isar != null) {
      await isar
          .writeTxn(() => isar.isarBluetoothCharacteristics.put(updatedChar));
    }
  }

  @override
  Future<bool> setNotifyValue(bool value) async {
    final updatedChar = this..isNotifying = value;

    final isar = UnlockdBluetooth.instance.isar;
    if (isar != null) {
      await isar
          .writeTxn(() => isar.isarBluetoothCharacteristics.put(updatedChar));
    }
    return value;
  }
}
