part of 'isar.dart';

const isarBluetoothConfigId = 1;

@collection
class IsarBluetoothConfig {
  Id id = isarBluetoothConfigId;

  @enumerated
  UnlockdBluetoothAdapterState adapterState =
      UnlockdBluetoothAdapterState.unknown;

  bool isScanningNow = false;

  @Backlink(to: 'config')
  final IsarLinks<IsarBluetoothDevice> systemDevices =
      IsarLinks<IsarBluetoothDevice>();

  @Backlink(to: 'config')
  IsarLinks<IsarScanResult> scanResults = IsarLinks<IsarScanResult>();
}
