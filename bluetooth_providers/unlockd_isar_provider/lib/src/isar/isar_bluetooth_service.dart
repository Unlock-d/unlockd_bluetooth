part of 'isar.dart';

@Collection(inheritance: false)
class IsarBluetoothService extends UnlockdBluetoothService {
  Id id = Isar.autoIncrement;

  @Backlink(to: 'isarBluetoothServices')
  final IsarLink<IsarBluetoothDevice> device = IsarLink();

  final IsarLinks<IsarBluetoothCharacteristic> isarCharacteristics =
      IsarLinks<IsarBluetoothCharacteristic>();

  @override
  IsarGuid serviceUuid = IsarGuid();

  @ignore
  @override
  List<UnlockdBluetoothCharacteristic> get characteristics =>
      isarCharacteristics.toList();
}
