part of 'isar.dart';

/// [IsarBluetoothService] which uses [Isar] as the underlying storage.
@Collection(inheritance: false)
class IsarBluetoothService extends UnlockdBluetoothService {
  /// Internal [Isar] id.
  Id id = Isar.autoIncrement;

  /// [Backlink] to [IsarBluetoothDevice].
  @Backlink(to: 'isarBluetoothServices')
  final IsarLink<IsarBluetoothDevice> device = IsarLink();

  /// [IsarLinks] to [IsarBluetoothCharacteristic].
  final IsarLinks<IsarBluetoothCharacteristic> isarCharacteristics =
      IsarLinks<IsarBluetoothCharacteristic>();

  @override
  IsarGuid serviceUuid = IsarGuid();

  @ignore
  @override
  List<UnlockdBluetoothCharacteristic> get characteristics =>
      isarCharacteristics.toList();
}
