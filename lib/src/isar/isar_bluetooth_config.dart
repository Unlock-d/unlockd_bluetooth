import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_adapter_state.dart';
import 'package:unlockd_bluetooth/src/isar/isar.dart';

part 'isar_bluetooth_config.g.dart';

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
