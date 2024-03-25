import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_fake_adapter/src/fakes/object_mothers.dart';

void main() {
  group('performUpdate', () {
    late int counter;
    late Completer<void> onConnectedCompleter;
    late Completer<void> onConnectingCompleter;
    late Completer<void> onDisconnectedCompleter;
    late Completer<void> onDisconnectingCompleter;
    late Completer<void> onAbortedCompleter;
    late Completer<void> onCompletedCompleter;
    late Completer<void> onProcessStartedCompleter;
    late Completer<void> onProcessStartingCompleter;

    setUp(() {
      counter = 0;
      onConnectedCompleter = Completer<void>();
      onConnectingCompleter = Completer<void>();
      onDisconnectedCompleter = Completer<void>();
      onDisconnectingCompleter = Completer<void>();
      onAbortedCompleter = Completer<void>();
      onCompletedCompleter = Completer<void>();
      onProcessStartedCompleter = Completer<void>();
      onProcessStartingCompleter = Completer<void>();
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
              counter++,
          onConnected: (remotedId) => onConnectedCompleter.complete(),
          onConnecting: (remotedId) => onConnectingCompleter.complete(),
          onDisconnected: (remotedId) => onDisconnectedCompleter.complete(),
          onDisconnecting: (remotedId) => onDisconnectingCompleter.complete(),
          onAborted: (remotedId) => onAbortedCompleter.complete(),
          onCompleted: (remotedId) => onCompletedCompleter.complete(),
          onProcessStarted: (remotedId) => onProcessStartedCompleter.complete(),
          onProcessStarting: (remotedId) =>
              onProcessStartingCompleter.complete(),
        );

    test('calls all methods when needed', () {
      final device = bluetoothDevice();

      fakeAsync((async) async {
        await callPerformUpdate(device);

        async.elapse(const Duration(milliseconds: 1200));

        expect(onConnectedCompleter.isCompleted, isTrue);
        expect(onConnectingCompleter.isCompleted, isTrue);
        expect(onDisconnectedCompleter.isCompleted, isTrue);
        expect(onDisconnectingCompleter.isCompleted, isTrue);
        expect(onAbortedCompleter.isCompleted, isFalse);
        expect(onCompletedCompleter.isCompleted, isTrue);
        expect(onProcessStartedCompleter.isCompleted, isTrue);
        expect(onProcessStartingCompleter.isCompleted, isTrue);
        expect(counter, equals(10));
      });
    });

    test('calls all methods when aborted', () {
      final device = bluetoothDevice(shouldAbortDfu: true);

      fakeAsync((async) async {
        await callPerformUpdate(device);

        async.elapse(const Duration(milliseconds: 1200));

        expect(onConnectedCompleter.isCompleted, isTrue);
        expect(onConnectingCompleter.isCompleted, isTrue);
        expect(onDisconnectedCompleter.isCompleted, isTrue);
        expect(onDisconnectingCompleter.isCompleted, isTrue);
        expect(onAbortedCompleter.isCompleted, isTrue);
        expect(onCompletedCompleter.isCompleted, isFalse);
        expect(onProcessStartedCompleter.isCompleted, isTrue);
        expect(onProcessStartingCompleter.isCompleted, isTrue);
        expect(counter, equals(10));
      });
    });
  });
}
