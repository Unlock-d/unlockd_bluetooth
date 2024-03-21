// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_universal_ble_adapter/unlockd_universal_ble_adapter.dart';

void main() {
  group('$UniversalBleAdapter', () {
    test('can be instantiated', () {
      expect(UniversalBleAdapter.initialize(), isNotNull);
    });
  });
}
