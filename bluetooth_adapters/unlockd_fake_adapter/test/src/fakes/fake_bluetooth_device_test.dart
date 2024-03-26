import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_fake_adapter/src/fakes/fakes.dart';
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
              progressController.add('onProgressChanged $percent $currentPart'),
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
            'onProgressChanged 10 1',
            'onProgressChanged 20 2',
            'onProgressChanged 30 3',
            'onProgressChanged 40 4',
            'onProgressChanged 50 5',
            'onProgressChanged 60 6',
            'onProgressChanged 70 7',
            'onProgressChanged 80 8',
            'onProgressChanged 90 9',
            'onProgressChanged 100 10',
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
      final device = bluetoothDevice(
        dfuProcessConfiguration:
            const DFUProcessConfiguration(shouldAbortDfu: true),
      );

      fakeAsync((async) {
        callPerformUpdate(device);

        expectLater(
          progressController.stream,
          emitsInOrder([
            'onConnecting',
            'onConnected',
            'onProcessStarting',
            'onProcessStarted',
            'onProgressChanged 10 1',
            'onProgressChanged 20 2',
            'onProgressChanged 30 3',
            'onProgressChanged 40 4',
            'onProgressChanged 50 5',
            'onProgressChanged 60 6',
            'onProgressChanged 70 7',
            'onProgressChanged 80 8',
            'onProgressChanged 90 9',
            'onProgressChanged 100 10',
            'onAborted',
            'onDisconnecting',
            'onDisconnected',
          ]),
        );

        async.elapse(const Duration(milliseconds: 1200));
        progressController.close();
      });
    });

    test('calls all methods when already connected', () {
      final device = bluetoothDevice(
        connectionConfiguration: const ConnectionConfiguration(
          initialConnectionState: UnlockdBluetoothConnectionState.connected,
        ),
        dfuProcessConfiguration:
            const DFUProcessConfiguration(shouldAbortDfu: true),
      );

      fakeAsync((async) {
        callPerformUpdate(device);

        expectLater(
          progressController.stream,
          emitsInOrder([
            'onProcessStarting',
            'onProcessStarted',
            'onProgressChanged 10 1',
            'onProgressChanged 20 2',
            'onProgressChanged 30 3',
            'onProgressChanged 40 4',
            'onProgressChanged 50 5',
            'onProgressChanged 60 6',
            'onProgressChanged 70 7',
            'onProgressChanged 80 8',
            'onProgressChanged 90 9',
            'onProgressChanged 100 10',
            'onAborted',
            'onDisconnecting',
            'onDisconnected',
          ]),
        );

        async.elapse(const Duration(milliseconds: 1200));
        progressController.close();
      });
    });

    test('less steps should be correctly spread', () {
      final device = bluetoothDevice(
        dfuProcessConfiguration: const DFUProcessConfiguration(
          shouldAbortDfu: true,
          amountOfProgressSteps: 3,
        ),
      );

      fakeAsync((async) {
        callPerformUpdate(device);

        expectLater(
          progressController.stream,
          emitsInOrder([
            'onConnecting',
            'onConnected',
            'onProcessStarting',
            'onProcessStarted',
            'onProgressChanged 33 1',
            'onProgressChanged 66 2',
            'onProgressChanged 100 3',
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
