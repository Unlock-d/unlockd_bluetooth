part of 'isar.dart';

/// [IsarBluetoothCharacteristic] which uses [Isar] as the underlying storage.
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

  /// The contents of the characteristic used internally.
  List<int> contents = [];

  @override
  IsarCharacteristicProperties properties = IsarCharacteristicProperties();

  @override
  bool isNotifying = false;

  @override
  IsarGuid characteristicUuid = IsarGuid();

  @ignore
  @override
  Stream<Uint8List> get onValueReceived =>
      IsarBluetoothAdapter.instance._isar.isarBluetoothCharacteristics
          .filter()
          .characteristicUuid(
            (q) => q.isarGuidEqualTo(characteristicUuid.isarGuid),
          )
          .watch(fireImmediately: true)
          .map((chars) => chars.isNotEmpty ? chars[0].contents : <int>[])
          .map(Uint8List.fromList);

  @override
  List<int> get lastValue => contents;

  @ignore
  @override
  List<IsarBluetoothDescriptor> get descriptors => isarDescriptors.toList();

  @override
  Future<Uint8List> read() async => Uint8List.fromList(contents);

  @override
  Future<void> write(
    Uint8List value, {
    bool? withoutResponse,
    bool? allowLongWrite,
  }) async {
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
    final isar = IsarBluetoothAdapter.instance._isar;
    await isar.writeTxn<void>(
      () => isar.isarBluetoothCharacteristics.put(
        updatedChar,
      ),
    );
  }
}
