import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth/unlockd_bluetooth.dart';

export 'isar_advertisement_data.dart';
export 'isar_bluetooth_characteristic.dart';
export 'isar_bluetooth_config.dart';
export 'isar_bluetooth_descriptor.dart';
export 'isar_bluetooth_device.dart';
export 'isar_bluetooth_emulator_config.dart';
export 'isar_bluetooth_service.dart';
export 'isar_manufacturer_data.dart';
export 'isar_scan_result.dart';
export 'isar_service_data.dart';

List<CollectionSchema<dynamic>> unlockdBluetoothSchemas = [
  IsarBluetoothConfigSchema,
  IsarBluetoothDeviceSchema,
  IsarBluetoothServiceSchema,
  IsarBluetoothCharacteristicSchema,
  IsarBluetoothDescriptorSchema,
  IsarScanResultSchema,
];
