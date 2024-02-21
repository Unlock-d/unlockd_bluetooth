// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_fake_provider/unlockd_fake_provider.dart';

void main() {
  group('UnlockdFakeProvider', () {
    test('can be instantiated', () {
      expect(FakeBluetoothProvider(), isNotNull);
    });
  });
}
