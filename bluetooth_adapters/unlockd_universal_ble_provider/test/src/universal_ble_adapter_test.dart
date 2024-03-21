import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_ble/universal_ble.dart';
import 'package:unlockd_universal_ble_adapter/src/universal_ble/universal_ble.dart';

import '../helpers.dart';

void main() {
  late UniversalBleAdapter provider;

  group('onScanResults', () {
    late StreamController<BleScanResult> scanController;

    final scan1 = bleScanResult(deviceId: '1');
    final scan2 = bleScanResult(deviceId: '2');
    final scan1SecondTime = bleScanResult(deviceId: '1');
    final scan3 = bleScanResult(deviceId: '3');

    setUp(() {
      scanController = StreamController.broadcast(sync: true);

      provider = UniversalBleAdapter.initialize(
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

    group(
      'Scanning with filters',
      () {
        final scan1 = bleScanResult(name: 'Moon (17)', deviceId: '1');
        final scan2 = bleScanResult(name: 'Random', deviceId: '2');

        test('Filtering names', () async {
          await provider.startScan(withNames: ['Moon']);

          unawaited(
            expectLater(
              provider.onScanResults(),
              emitsInOrder([
                [scanResult(scan1)],
              ]),
            ),
          );

          scanController
            ..add(scan1)
            ..add(scan2);
        });

        test('Filtering remoteId', () async {
          await provider.startScan(withRemoteIds: ['2']);

          unawaited(
            expectLater(
              provider.onScanResults(),
              emitsInOrder([
                [scanResult(scan2)],
              ]),
            ),
          );

          scanController
            ..add(scan1)
            ..add(scan2);
        });

        test('Multiple filters should work as a logical *or*', () async {
          await provider.startScan(
            withRemoteIds: ['2'],
            withNames: ['Moon'],
          );

          unawaited(
            expectLater(
              provider.onScanResults(),
              emitsInOrder([
                [scanResult(scan1), scanResult(scan2)],
              ]),
            ),
          );

          scanController
            ..add(scan1)
            ..add(scan2);
        });
      },
    );
  });

  group('startScan', () {
    late UniversalBlePlatform universalBle;

    setUp(() {
      universalBle = MockUniversalBle();

      provider = UniversalBleAdapter.initialize(
        universalBle: universalBle,
      );
    });

    test('Starting a scan while already scanning will stop the scan', () async {
      when(() => universalBle.startScan()).thenAnswer((_) async {});
      when(() => universalBle.stopScan()).thenAnswer((_) async {});

      await provider.startScan();
      await provider.startScan();

      verify(() => universalBle.stopScan()).called(1);
    });
  });

  group('isScanning', () {
    late UniversalBlePlatform universalBle;

    setUp(() {
      universalBle = FakeUniversalBle();

      provider = UniversalBleAdapter.initialize(
        universalBle: universalBle,
      );
    });

    test('Should emit the correct scanning state', () async {
      await provider.startScan(timeout: const Duration(milliseconds: 100));
      expect(provider.isScanningNow, isTrue);

      final isScanningStream = provider.isScanning();

      unawaited(
        expectLater(
          isScanningStream,
          emitsInOrder([
            true,
            false,
          ]),
          reason: 'Should emit true when scanning and false when not',
        ),
      );

      await Future<void>.delayed(const Duration(milliseconds: 200));
      expect(provider.isScanningNow, isFalse);

      unawaited(
        expectLater(
          isScanningStream,
          emitsInOrder([
            true,
            false,
          ]),
          reason: 'Should emit the correct state when starting a scan again',
        ),
      );

      await provider.startScan(timeout: const Duration(milliseconds: 100));
      expect(provider.isScanningNow, isTrue);
    });
  });
}

UniversalBleScanResult scanResult(BleScanResult scan1) =>
    UniversalBleScanResult.fromUniversalBle(scan1);

BleScanResult bleScanResult({String? name, String? deviceId}) {
  final id = deviceId ?? '1';
  return BleScanResult(
    name: name ?? 'device$id',
    deviceId: id,
  );
}
