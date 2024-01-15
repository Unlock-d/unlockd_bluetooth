import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth/src/isar/isar.dart';
import 'package:unlockd_bluetooth/unlockd_bluetooth.dart';

part 'isar_bluetooth_descriptor.g.dart';

@Collection(inheritance: false)
class IsarBluetoothDescriptor extends UnlockdBluetoothDescriptor {
  Id id = Isar.autoIncrement;

  List<int> contents = [];

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

    final isar = UnlockdBluetooth.instance.isar;
    if (isar != null) {
      await isar
          .writeTxn(() => isar.isarBluetoothDescriptors.put(updatedDescriptor));
    }
  }
}
