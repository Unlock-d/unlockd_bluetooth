import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

/// A storage provider for the Unlock'd Bluetooth package.
class IsarBluetoothStorage implements UnlockdBluetoothStorage {
  /// Creates a new [IsarBluetoothStorage] instance.
  IsarBluetoothStorage(this._isar);

  /// The Isar instance to use for storage.
  final Isar _isar;

  Isar get isar => _isar;
}
