import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth/src/dfu/dfu.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';

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

    expect(completer.isCompleted, isTrue);
  });
}
