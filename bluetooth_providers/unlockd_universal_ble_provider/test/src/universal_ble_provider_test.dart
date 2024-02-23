import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:universal_ble/universal_ble.dart';
import 'package:unlockd_universal_ble_provider/src/universal_ble/universal_ble.dart';

import '../helpers.dart';

void main() {
  late UniversalBleProvider provider;

  group('onScanResults', () {
    late StreamController<BleScanResult> scanController;

    setUp(() {
      scanController = StreamController.broadcast(sync: true);

      provider = UniversalBleProvider.initialize(
        universalBle: FakeUniversalBle(
          scanController: scanController,
        ),
      );
    });

    tearDown(() {
      scanController.close();
      provider.close();
    });

    test('Scanning multiple devices should emit these results', () async {
      final scan1 = bleScanResult();
      final scan2 = bleScanResult(deviceId: '2');
      final scan1SecondTime = bleScanResult();
      final scan3 = bleScanResult(deviceId: '3');

      unawaited(
        expectLater(
          provider.onScanResults(),
          emitsInOrder([
            [scanResult(scan1), scanResult(scan2), scanResult(scan3)],
          ]),
        ),
      );

      scanController
        ..add(scan1)
        ..add(scan2)
        ..add(scan1SecondTime)
        ..add(scan3);
    });

    test('Multiple listens should not mess with results', () async {
      final scan1 = bleScanResult();
      final scan2 = bleScanResult(deviceId: '2');
      final scan1SecondTime = bleScanResult();
      final scan3 = bleScanResult(deviceId: '3');

      unawaited(
        expectLater(
          provider.onScanResults(),
          emitsInOrder([
            [scanResult(scan1), scanResult(scan2)],
            [scanResult(scan1), scanResult(scan2), scanResult(scan3)],
          ]),
          reason: 'First stream should receive all emissions',
        ),
      );

      scanController
        ..add(scan1)
        ..add(scan2);

      // We wait for the debounce to expire
      await Future<void>.delayed(const Duration(milliseconds: 300));

      unawaited(
        expectLater(
          provider.onScanResults(),
          emitsInOrder([
            [scanResult(scan1), scanResult(scan2), scanResult(scan3)],
          ]),
          reason: 'Second stream should not receive previous emissions',
        ),
      );

      scanController
        ..add(scan1SecondTime)
        ..add(scan3);
    });
  });
}

UniversalBleScanResult scanResult(BleScanResult scan1) =>
    UniversalBleScanResult.fromUniversalBle(scan1);

BleScanResult bleScanResult({String deviceId = '1'}) => BleScanResult(
      name: 'device$deviceId',
      deviceId: deviceId,
    );
