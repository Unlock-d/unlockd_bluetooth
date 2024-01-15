import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';

part 'isar_characteristic_properties.g.dart';

@embedded
class IsarCharacteristicProperties extends UnlockdCharacteristicProperties {
  @override
  bool writeWithoutResponse = false;

  @override
  bool read = false;

  @override
  bool authenticatedSignedWrites = false;

  @override
  bool broadcast = false;

  @override
  bool extendedProperties = false;

  @override
  bool indicate = false;

  @override
  bool indicateEncryptionRequired = false;

  @override
  bool notify = false;

  @override
  bool notifyEncryptionRequired = false;

  @override
  bool write = false;
}
