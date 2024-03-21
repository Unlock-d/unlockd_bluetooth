import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_fake_adapter/unlockd_fake_adapter.dart';

void main() {
  group('UnlockdFakeProvider', () {
    test('can be instantiated', () {
      expect(FakeBluetoothAdapter(), isNotNull);
    });
  });
}
