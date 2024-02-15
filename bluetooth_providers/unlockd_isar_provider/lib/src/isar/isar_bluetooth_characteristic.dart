part of 'isar.dart';

/// A class representing a Bluetooth characteristic in Isar.
@Collection(inheritance: false)
class IsarBluetoothCharacteristic extends UnlockdBluetoothCharacteristic {
  /// Default constructor needed for [Isar]
  IsarBluetoothCharacteristic();

  /// Create a [IsarBluetoothCharacteristic] with the given [contents].
  factory IsarBluetoothCharacteristic.withContents(
    List<int> contents, {
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
    final properties = IsarCharacteristicProperties.withValues(
      broadcast: broadcast,
      read: read,
      writeWithoutResponse: writeWithoutResponse,
      write: write,
      notify: notify,
      indicate: indicate,
      authenticatedSignedWrites: authenticatedSignedWrites,
      extendedProperties: extendedProperties,
      notifyEncryptionRequired: notifyEncryptionRequired,
      indicateEncryptionRequired: indicateEncryptionRequired,
    );

    return IsarBluetoothCharacteristic()
      ..contents = contents
      ..properties = properties;
  }

  /// Internal [Isar] id.
  Id id = Isar.autoIncrement;

  /// [Backlink] to [IsarBluetoothService].
  @Backlink(to: 'isarCharacteristics')
  final IsarLink<IsarBluetoothService> service = IsarLink();

  /// [IsarLinks] to [IsarBluetoothDescriptor].
  final IsarLinks<IsarBluetoothDescriptor> isarDescriptors = IsarLinks();

  /// The contents of the characteristic.
  List<int> contents = [];

  @override
  IsarCharacteristicProperties properties = IsarCharacteristicProperties();

  @override
  bool isNotifying = false;

  @override
  IsarGuid characteristicUuid = IsarGuid();

  @ignore
  @override
  Stream<List<int>> get onValueReceived => Stream.value(contents);

  @override
  List<int> get lastValue => contents;

  @ignore
  @override
  List<IsarBluetoothDescriptor> get descriptors => isarDescriptors.toList();

  @override
  Future<List<int>> read() async => contents;

  @override
  Future<void> write(List<int> value, {bool? withoutResponse}) async {
    final updatedChar = this..contents = value;

    await _writeChar(updatedChar);
  }

  @override
  Future<bool> setNotifyValue({required bool value}) async {
    final updatedChar = this..isNotifying = value;

    await _writeChar(updatedChar);
    return value;
  }

  Future<void> _writeChar(IsarBluetoothCharacteristic updatedChar) async {
    final isar = IsarBluetoothProvider.instance._isar;
    await isar.writeTxn<void>(
      () => isar.isarBluetoothCharacteristics.put(
        updatedChar,
      ),
    );
  }
}
