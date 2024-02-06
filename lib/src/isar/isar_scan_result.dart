
part of 'isar.dart';

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
