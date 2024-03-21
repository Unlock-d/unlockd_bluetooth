import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_flutter_blue_plus_adapter/src/fbp/fbp.dart';

void main() {
  test('Can initialize the provider', () {
    final actual = FbpBluetoothAdapter.instance;

    expect(actual, isNotNull);
  });
}
