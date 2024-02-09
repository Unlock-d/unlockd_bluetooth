import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_isar_storage_provider/src/isar_bluetooth_storage.dart';

/// Extension methods for the [UnlockdBluetoothStorage] class.
extension UnlockdBluetoothStorageExtension on UnlockdBluetoothStorage {
  /// The Isar instance used for storage.
  Isar? get isar =>
      this is IsarBluetoothStorage ? (this as IsarBluetoothStorage).isar : null;
}
