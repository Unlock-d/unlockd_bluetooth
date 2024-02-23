// ignore_for_file: avoid_setters_without_getters

import 'dart:async';

import 'package:universal_ble/universal_ble.dart';
import 'package:unlockd_universal_ble_provider/unlockd_universal_ble_provider.dart';

class FakeUniversalBle extends UniversalBleWrapper {
  FakeUniversalBle({
    StreamController<BleScanResult>? scanController,
  }) : _scanController = scanController ?? StreamController.broadcast();

  final StreamController<BleScanResult> _scanController;

  @override
  Future<bool> enableBluetooth() {
    throw UnimplementedError();
  }

  @override
  set onAvailabilityChange(OnAvailabilityChange? onAvailabilityChange) {
    // TODO: implement onAvailabilityChange
  }

  @override
  set onScanResult(OnScanResult? onScanResult) {
    if (!_scanController.hasListener) {
      _scanController.stream.listen(onScanResult);
    }
  }

  @override
  Future<void> startScan({
    WebRequestOptionsBuilder? webRequestOptions,
  }) {
    // TODO: implement startScan
    throw UnimplementedError();
  }

  @override
  Future<void> stopScan() {
    // TODO: implement stopScan
    throw UnimplementedError();
  }
}
