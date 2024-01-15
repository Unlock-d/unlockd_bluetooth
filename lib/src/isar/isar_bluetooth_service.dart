import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';
import 'package:unlockd_bluetooth/src/isar/isar.dart';

part 'isar_bluetooth_service.g.dart';

@Collection(inheritance: false)
class IsarBluetoothService extends UnlockdBluetoothService {
  Id id = Isar.autoIncrement;

  @Backlink(to: 'isarBluetoothServices')
  final IsarLink<IsarBluetoothDevice> device = IsarLink();

  final IsarLinks<IsarBluetoothCharacteristic> isarCharacteristics =
      IsarLinks<IsarBluetoothCharacteristic>();

  @override
  String get uuid => '';

  @override
  String get serviceUuid => '';

  @ignore
  @override
  List<UnlockdBluetoothCharacteristic> get characteristics =>
      isarCharacteristics.toList();
}
