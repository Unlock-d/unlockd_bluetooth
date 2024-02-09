import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_isar_provider/src/isar/isar.dart';

void main() {
  test("Can't get an instance without calling initialize", () {
    expect(
      () => IsarBluetoothProvider.instance,
      throwsA(isA<AssertionError>()),
    );
  });
}
