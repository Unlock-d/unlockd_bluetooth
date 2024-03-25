import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_fake_adapter/src/fakes/object_mothers.dart';

void main() {
  group('performUpdate', () {
    late StreamController<String> progressController;

    setUp(() {
      progressController = StreamController<String>(sync: true);
    });

    Future<void> callPerformUpdate(
      UnlockdBluetoothDevice device,
    ) =>
        device.performUpdate(
          FakeFirmwarePackage('path', 10),
          onProgressChanged: (
            deviceAddress,
            percent,
            speed,
            avgSpeed,
            currentPart,
            partsTotal,
          ) =>
              progressController.add('onProgressChanged $currentPart'),
          onConnected: (remotedId) => progressController.add('onConnected'),
          onConnecting: (remotedId) => progressController.add('onConnecting'),
          onDisconnected: (remotedId) =>
              progressController.add('onDisconnected'),
          onDisconnecting: (remotedId) =>
              progressController.add('onDisconnecting'),
          onAborted: (remotedId) => progressController.add('onAborted'),
          onCompleted: (remotedId) => progressController.add('onCompleted'),
          onProcessStarted: (remotedId) =>
              progressController.add('onProcessStarted'),
          onProcessStarting: (remotedId) =>
              progressController.add('onProcessStarting'),
        );

    test('calls all methods when needed', () {
      final device = bluetoothDevice();

      fakeAsync((async) {
        callPerformUpdate(device);

        expectLater(
          progressController.stream,
          emitsInOrder([
            'onConnecting',
            'onConnected',
            'onProcessStarting',
            'onProcessStarted',
            'onProgressChanged 1',
            'onProgressChanged 2',
            'onProgressChanged 3',
            'onProgressChanged 4',
            'onProgressChanged 5',
            'onProgressChanged 6',
            'onProgressChanged 7',
            'onProgressChanged 8',
            'onProgressChanged 9',
            'onProgressChanged 10',
            'onCompleted',
            'onDisconnecting',
            'onDisconnected',
          ]),
        );

        async.elapse(const Duration(milliseconds: 1200));
        progressController.close();
      });
    });

    test('calls all methods when aborted', () {
      final device = bluetoothDevice(shouldAbortDfu: true);

      fakeAsync((async) {
        callPerformUpdate(device);

        expectLater(
          progressController.stream,
          emitsInOrder([
            'onConnecting',
            'onConnected',
            'onProcessStarting',
            'onProcessStarted',
            'onProgressChanged 1',
            'onProgressChanged 2',
            'onProgressChanged 3',
            'onProgressChanged 4',
            'onProgressChanged 5',
            'onProgressChanged 6',
            'onProgressChanged 7',
            'onProgressChanged 8',
            'onProgressChanged 9',
            'onProgressChanged 10',
            'onAborted',
            'onDisconnecting',
            'onDisconnected',
          ]),
        );

        async.elapse(const Duration(milliseconds: 1200));
        progressController.close();
      });
    });
  });
}
