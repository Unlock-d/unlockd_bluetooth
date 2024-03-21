import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_isar_adapter/src/isar/isar.dart';

void main() {
  late Isar isar;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
    isar = await Isar.open(unlockdBluetoothSchemas, directory: '.');
    await IsarBluetoothAdapter.initialize(
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

  group('Read/Write/Subscribe', () {
    late IsarBluetoothDevice device;
    late IsarBluetoothService service;
    late IsarBluetoothCharacteristic characteristic;

    setUp(() async {
      characteristic = IsarBluetoothCharacteristic()
        ..characteristicUuid = IsarGuid.fromString(
          NordicGuidEnum.MANUFACTURER_NAME_CHAR.value.str128,
        )
        ..contents = [1, 2, 3];

      service = IsarBluetoothService()
        ..serviceUuid =
            IsarGuid.fromString(NordicGuidEnum.DEVICE_INFO_SERVICE.value.str128)
        ..isarCharacteristics.add(characteristic);

      device = IsarBluetoothDevice()
        ..remoteId = '1'
        ..isarBluetoothServices.add(service);

      await isar.writeTxn<void>(() async {
        await isar.isarBluetoothCharacteristics.clear();
        await isar.isarBluetoothServices.clear();
        await isar.isarBluetoothDevices.clear();

        await isar.isarBluetoothCharacteristics.put(characteristic);
        await isar.isarBluetoothServices.put(service);
        await isar.isarBluetoothDevices.put(device);

        await service.isarCharacteristics.save();
        await device.isarBluetoothServices.save();
      });
    });

    tearDown(() async {
      await isar.writeTxn<void>(() async {
        await isar.isarBluetoothCharacteristics.clear();
        await isar.isarBluetoothServices.clear();
        await isar.isarBluetoothDevices.clear();
      });
    });

    test('Reading on a device should return the contents of the characteristic',
        () async {
      final actual = await device.read(
        NordicGuidEnum.DEVICE_INFO_SERVICE.value,
        NordicGuidEnum.MANUFACTURER_NAME_CHAR.value,
      );

      expect(
        actual,
        [1, 2, 3],
      );
    });

    test(
      'Writing on a device should overwrite the '
      'contents of the characteristic',
      () async {
        await device.write(
          NordicGuidEnum.DEVICE_INFO_SERVICE.value,
          NordicGuidEnum.MANUFACTURER_NAME_CHAR.value,
          value: Uint8List.fromList([4, 5, 6]),
        );

        expect(
          characteristic.contents,
          [4, 5, 6],
        );
      },
    );

    test('Subscribing to device should emit changes', () async {
      final subscription = device.subscribe(
        NordicGuidEnum.DEVICE_INFO_SERVICE.value,
        NordicGuidEnum.MANUFACTURER_NAME_CHAR.value,
      );

      unawaited(
        expectLater(
          subscription,
          emitsInOrder([
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
          ]),
        ),
      );

      await isar.writeTxn<void>(() async {
        characteristic.contents = [4, 5, 6];
        await isar.isarBluetoothCharacteristics.put(characteristic);
      });
      await isar.writeTxn<void>(() async {
        characteristic.contents = [7, 8, 9];
        await isar.isarBluetoothCharacteristics.put(characteristic);
      });
    });
  });
}
