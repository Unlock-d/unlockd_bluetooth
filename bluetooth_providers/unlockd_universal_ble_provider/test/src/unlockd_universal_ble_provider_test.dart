// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_universal_ble_provider/unlockd_universal_ble_provider.dart';

void main() {
  group('$UniversalBleProvider', () {
    test('can be instantiated', () {
      expect(UniversalBleProvider.initialize(), isNotNull);
    });
  });
}
