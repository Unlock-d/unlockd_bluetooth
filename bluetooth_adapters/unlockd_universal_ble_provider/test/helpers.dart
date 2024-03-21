// ignore_for_file: avoid_setters_without_getters

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_ble/universal_ble.dart';

typedef OnValueChangedValues = ({
  String deviceId,
  String characteristicUuid,
  Uint8List value,
});

class MockUniversalBle extends Mock implements UniversalBlePlatform {}

class FakeUniversalBle extends Fake implements UniversalBlePlatform {
  FakeUniversalBle({
    StreamController<BleScanResult>? scanController,
    StreamController<OnValueChangedValues>? valueController,
  })  : _scanController = scanController ?? StreamController.broadcast(),
        _valueController = valueController ?? StreamController.broadcast();

  final StreamController<BleScanResult> _scanController;
  final StreamController<OnValueChangedValues> _valueController;

  @override
  set onScanResult(OnScanResult? onScanResult) {
    if (!_scanController.hasListener) {
      _scanController.stream.listen(onScanResult);
    }
  }

  @override
  set onValueChanged(OnValueChanged? onValueChanged) {
    if (!_valueController.hasListener) {
      _valueController.stream.listen((event) {
        onValueChanged?.call(
          event.deviceId,
          event.characteristicUuid,
          event.value,
        );
      });
    }
  }

  @override
  Future<void> startScan({
    WebRequestOptionsBuilder? webRequestOptions,
  }) async {
    debugPrint('startScan');
  }

  @override
  Future<void> stopScan() async {
    debugPrint('stopScan');
  }

  @override
  Future<void> setNotifiable(
    String deviceId,
    String service,
    String characteristic,
    BleInputProperty bleInputProperty,
  ) async {}
}
