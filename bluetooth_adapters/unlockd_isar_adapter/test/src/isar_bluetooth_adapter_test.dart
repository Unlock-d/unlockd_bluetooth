import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_isar_adapter/src/isar/isar.dart';

void main() {
  test("Can't get an instance without calling initialize", () {
    expect(
      () => IsarBluetoothAdapter.instance,
      throwsA(isA<AssertionError>()),
    );
  });
}
