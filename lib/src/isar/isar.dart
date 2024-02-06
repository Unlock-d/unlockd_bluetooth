import 'dart:async';

import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth/unlockd_bluetooth.dart';

part 'isar.g.dart';
part 'isar_advertisement_data.dart';
part 'isar_bluetooth_characteristic.dart';
part 'isar_bluetooth_config.dart';
part 'isar_bluetooth_descriptor.dart';
part 'isar_bluetooth_device.dart';
part 'isar_bluetooth_emulator_config.dart';
part 'isar_bluetooth_service.dart';
part 'isar_characteristic_properties.dart';
part 'isar_manufacturer_data.dart';
part 'isar_scan_result.dart';
part 'isar_service_data.dart';

List<CollectionSchema<dynamic>> unlockdBluetoothSchemas = [
  IsarBluetoothConfigSchema,
  IsarBluetoothDeviceSchema,
  IsarBluetoothServiceSchema,
  IsarBluetoothCharacteristicSchema,
  IsarBluetoothDescriptorSchema,
  IsarScanResultSchema,
];
