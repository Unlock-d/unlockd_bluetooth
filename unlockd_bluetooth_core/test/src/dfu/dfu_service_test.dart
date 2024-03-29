import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

import '../../helpers/helpers.dart';

void main() {
  late DfuService dfuService;

  setUp(() {});

  test('', () async {
    dfuService = DfuService.instance(nordicDfu: FakeNordicDfu());
    final firmwarePackage = FakeFirmwarePackage('filePath', 0);
    final completer = Completer<void>();

    await dfuService.performUpdate(
      'remoteId',
      firmwarePackage,
      onProcessStarted: (_) {
        completer.complete();
      },
      onProgressChanged: (
        deviceAddress,
        percent,
        speed,
        avgSpeed,
        currentPart,
        partsTotal,
      ) {},
    );

    await Future<void>.delayed(const Duration(seconds: 1));

    expect(completer.isCompleted, isTrue);
  });
}
