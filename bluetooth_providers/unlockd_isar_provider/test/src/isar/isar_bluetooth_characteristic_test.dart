import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
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
      await isar.isarBluetoothCharacteristics.clear();
    });
  });

  tearDown(() async {
    await isar.writeTxn<void>(() async {
      await isar.isarBluetoothCharacteristics.clear();
    });
  });

  tearDownAll(() async {
    await isar.close();
  });

  group('Streams emit correct states after upserting a characteristic', () {
    late IsarBluetoothCharacteristic char;

    setUp(() {
      char = IsarBluetoothCharacteristic()
        ..characteristicUuid =
            IsarGuid.fromString('80cb0a2e-e612-47c1-88b9-3f7154fbe361');
    });

    test('onValueReceived', () async {
      unawaited(
        expectLater(
          char.onValueReceived,
          emitsInOrder([
            <int>[],
            [10, 10, 10],
          ]),
        ),
      );

      await isar.writeTxn<void>(() async {
        await isar.isarBluetoothCharacteristics.put(char);
        char.contents = [10, 10, 10];
        await isar.isarBluetoothCharacteristics.put(char);
      });
    });
  });
}
