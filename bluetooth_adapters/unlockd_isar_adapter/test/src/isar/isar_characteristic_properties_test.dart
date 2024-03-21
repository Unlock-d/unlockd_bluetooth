import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_isar_adapter/src/isar/isar.dart';

void main() {
  test('Can update properties after creation', () {
    final properties = IsarCharacteristicProperties()
      ..read = true
      ..broadcast = true;

    expect(properties.read, true);
    expect(properties.broadcast, true);
  });
}
