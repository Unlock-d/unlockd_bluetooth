import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_isar_provider/src/isar/isar.dart';

void main() {
  late Isar isar;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
    isar = await Isar.open(unlockdBluetoothSchemas, directory: '.');
    await IsarBluetoothProvider.initialize(
      isar: isar,
      initialize: (_) async {},
    );
  });

  setUp(() async {
    await isar.writeTxn<void>(() async {
      await isar.isarBluetoothDevices.clear();
    });
  });

  tearDown(() async {
    await isar.writeTxn<void>(() async {
      await isar.isarBluetoothDevices.clear();
    });
  });

  tearDownAll(() async {
    await isar.close();
  });

  group('Streams emit correct states after upserting a device', () {
    late IsarBluetoothDevice device;

    setUp(() {
      device = IsarBluetoothDevice()..remoteId = '1';
    });

    test('connectionState', () async {
      unawaited(
        expectLater(
          device.connectionState,
          emitsInOrder([
            UnlockdBluetoothConnectionState.disconnected,
            UnlockdBluetoothConnectionState.connected,
          ]),
        ),
      );

      await isar.writeTxn<void>(() async {
        await isar.isarBluetoothDevices.put(device);
        device.isarConnectionState = UnlockdBluetoothConnectionState.connected;
        await isar.isarBluetoothDevices.put(device);
      });
    });

    test('mtu', () async {
      unawaited(
        expectLater(
          device.mtu,
          emitsInOrder([0, 10]),
        ),
      );

      await isar.writeTxn<void>(() async {
        await isar.isarBluetoothDevices.put(device);
        device.mtuNow = 10;
        await isar.isarBluetoothDevices.put(device);
      });
    });
  });
}
