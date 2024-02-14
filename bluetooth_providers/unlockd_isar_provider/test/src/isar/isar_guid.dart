import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_isar_provider/src/isar/isar.dart';

void main() {
  test('Can set values of $IsarGuid', () {
    final guid = IsarGuid()..bytes = [1, 2, 3, 4, 5];
    expect(guid.bytes, [1, 2, 3, 4, 5]);
  });
}
