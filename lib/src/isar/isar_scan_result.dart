import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_device.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_scan_result.dart';
import 'package:unlockd_bluetooth/src/isar/isar.dart';

part 'isar_scan_result.g.dart';

@Collection(inheritance: false)
class IsarScanResult extends UnlockdScanResult {
  IsarScanResult() {
    config.value = IsarBluetoothConfig();
  }

  Id id = Isar.autoIncrement;

  final IsarLink<IsarBluetoothConfig> config = IsarLink();

  final IsarLink<IsarBluetoothDevice> isarBluetoothDevice = IsarLink();

  @override
  int rssi = 0;

  @override
  IsarAdvertisementData advertisementData = IsarAdvertisementData();

  @ignore
  @override
  UnlockdBluetoothDevice get device {
    if (isarBluetoothDevice.value == null) {
      throw StateError('isarBluetoothDevice of IsarScanResult [$id] is null');
    }

    return isarBluetoothDevice.value!;
  }
}
