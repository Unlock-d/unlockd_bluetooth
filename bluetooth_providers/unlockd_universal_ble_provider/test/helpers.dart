// ignore_for_file: avoid_setters_without_getters

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_ble/universal_ble.dart';

class MockUniversalBle extends Mock implements UniversalBlePlatform {}

class FakeUniversalBle extends Fake implements UniversalBlePlatform {
  FakeUniversalBle({
    StreamController<BleScanResult>? scanController,
  }) : _scanController = scanController ?? StreamController.broadcast();

  final StreamController<BleScanResult> _scanController;

  @override
  set onScanResult(OnScanResult? onScanResult) {
    if (!_scanController.hasListener) {
      _scanController.stream.listen(onScanResult);
    }
  }

  @override
  Future<void> startScan({
    WebRequestOptionsBuilder? webRequestOptions,
  }) async {}
}
