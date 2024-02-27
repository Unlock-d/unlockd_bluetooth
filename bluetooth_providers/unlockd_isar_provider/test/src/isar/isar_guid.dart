import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_isar_provider/src/isar/isar.dart';

void main() {
  test('Can set values of $IsarGuid', () {
    final guid = IsarGuid()..bytes = [1, 2, 3, 4, 5];
    expect(guid.bytes, [1, 2, 3, 4, 5]);
  });

  test('Two GUIDs are the same', () {
    UnlockdGuid guid1 =
        IsarGuid.fromString(NordicGuidEnum.DEVICE_INFO_SERVICE.value.str128);
    UnlockdGuid guid2 =
        IsarGuid.fromString(NordicGuidEnum.DEVICE_INFO_SERVICE.value.str128);

    expect(guid1 == guid2, isTrue);

    guid1 =
        IsarGuid.fromString(NordicGuidEnum.DEVICE_INFO_SERVICE.value.str128);
    guid2 = NordicGuidEnum.DEVICE_INFO_SERVICE.value;

    expect(guid1 == guid2, isFalse);
  });
}
