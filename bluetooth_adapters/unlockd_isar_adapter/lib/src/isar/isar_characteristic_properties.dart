part of 'isar.dart';

/// A [IsarCharacteristicProperties] implementation for Isar.
@embedded
class IsarCharacteristicProperties extends UnlockdCharacteristicProperties {
  /// Default constructor needed for [Isar]
  IsarCharacteristicProperties();

  /// Create a [IsarCharacteristicProperties] with the given values.
  factory IsarCharacteristicProperties.withValues({
    bool? broadcast,
    bool? read,
    bool? writeWithoutResponse,
    bool? write,
    bool? notify,
    bool? indicate,
    bool? authenticatedSignedWrites,
    bool? extendedProperties,
    bool? notifyEncryptionRequired,
    bool? indicateEncryptionRequired,
  }) {
    return IsarCharacteristicProperties()
      ..broadcast = broadcast ?? false
      ..read = read ?? false
      ..writeWithoutResponse = writeWithoutResponse ?? false
      ..write = write ?? false
      ..notify = notify ?? false
      ..indicate = indicate ?? false
      ..authenticatedSignedWrites = authenticatedSignedWrites ?? false
      ..extendedProperties = extendedProperties ?? false
      ..notifyEncryptionRequired = notifyEncryptionRequired ?? false
      ..indicateEncryptionRequired = indicateEncryptionRequired ?? false;
  }

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
