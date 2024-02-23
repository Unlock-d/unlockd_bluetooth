// ignore_for_file: avoid_setters_without_getters

import 'dart:async';
import 'dart:typed_data';

import 'package:universal_ble/universal_ble.dart';

class FakeUniversalBle extends UniversalBlePlatform {
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
  Future<void> connect(String deviceId, {Duration? connectionTimeout}) {
    // TODO(PJ): implement connect
    throw UnimplementedError();
  }

  @override
  Future<void> disconnect(String deviceId) {
    // TODO(PJ): implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<List<BleService>> discoverServices(String deviceId) {
    // TODO(PJ): implement discoverServices
    throw UnimplementedError();
  }

  @override
  Future<bool> enableBluetooth() {
    // TODO(PJ): implement enableBluetooth
    throw UnimplementedError();
  }

  @override
  Future<AvailabilityState> getBluetoothAvailabilityState() {
    // TODO(PJ): implement getBluetoothAvailabilityState
    throw UnimplementedError();
  }

  @override
  Future<List<BleScanResult>> getConnectedDevices(List<String>? withServices) {
    // TODO(PJ): implement getConnectedDevices
    throw UnimplementedError();
  }

  @override
  Future<bool> isPaired(String deviceId) {
    // TODO(PJ): implement isPaired
    throw UnimplementedError();
  }

  @override
  Future<void> pair(String deviceId) {
    // TODO(PJ): implement pair
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> readValue(
      String deviceId, String service, String characteristic) {
    // TODO(PJ): implement readValue
    throw UnimplementedError();
  }

  @override
  Future<int> requestMtu(String deviceId, int expectedMtu) {
    // TODO(PJ): implement requestMtu
    throw UnimplementedError();
  }

  @override
  Future<void> setNotifiable(String deviceId, String service,
      String characteristic, BleInputProperty bleInputProperty) {
    // TODO(PJ): implement setNotifiable
    throw UnimplementedError();
  }

  @override
  Future<void> startScan({WebRequestOptionsBuilder? webRequestOptions}) {
    // TODO(PJ): implement startScan
    throw UnimplementedError();
  }

  @override
  Future<void> stopScan() {
    // TODO(PJ): implement stopScan
    throw UnimplementedError();
  }

  @override
  Future<void> unPair(String deviceId) {
    // TODO(PJ): implement unPair
    throw UnimplementedError();
  }

  @override
  Future<void> writeValue(
      String deviceId,
      String service,
      String characteristic,
      Uint8List value,
      BleOutputProperty bleOutputProperty) {
    // TODO(PJ): implement writeValue
    throw UnimplementedError();
  }
}
