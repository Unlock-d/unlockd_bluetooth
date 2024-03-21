import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_flutter_blue_plus_provider/src/extension/fbp_bluetooth_connector.dart';
import 'package:unlockd_flutter_blue_plus_provider/src/fbp/fbp.dart';

/// A [UnlockdBluetoothAdapter] which uses [FlutterBluePlus]
/// to retrieve Bluetooth information.
class FbpBluetoothProvider extends UnlockdBluetoothAdapter {
  FbpBluetoothProvider._() {
    assert(
      () {
        if (!UnlockdBluetoothHelper.kIsWeb && UnlockdBluetoothHelper.kIsTest) {
          FbpBluetoothConnector().initialize(this);
        }
        return true;
      }(),
      'This should only be called in debug mode',
    );
  }

  /// Returns the [FbpBluetoothProvider] instance.
  static final FbpBluetoothProvider instance = FbpBluetoothProvider._();

  @override
  Future<void> close() async {
    // Nothing to do here.
  }

  @override
  Future<void> turnOn() => FlutterBluePlus.turnOn();

  @override
  Future<void> turnOff() => FlutterBluePlus.turnOff();

  @override
  Stream<UnlockdBluetoothAdapterState> adapterState() {
    return FlutterBluePlus.adapterState.map(
      (event) => switch (event) {
        BluetoothAdapterState.unknown => UnlockdBluetoothAdapterState.unknown,
        BluetoothAdapterState.unavailable =>
          UnlockdBluetoothAdapterState.unavailable,
        BluetoothAdapterState.unauthorized =>
          UnlockdBluetoothAdapterState.unauthorized,
        BluetoothAdapterState.turningOn =>
          UnlockdBluetoothAdapterState.turningOn,
        BluetoothAdapterState.on => UnlockdBluetoothAdapterState.on,
        BluetoothAdapterState.turningOff =>
          UnlockdBluetoothAdapterState.turningOff,
        BluetoothAdapterState.off => UnlockdBluetoothAdapterState.off,
      },
    );
  }

  @override
  bool get isScanningNow => FlutterBluePlus.isScanningNow;

  @override
  Stream<bool> isScanning() => FlutterBluePlus.isScanning;

  @override
  Future<void> startScan({
    Duration? timeout,
    bool? androidUsesFineLocation,
    List<UnlockdGuid>? withServices,
    List<String>? withRemoteIds,
    List<String>? withNames,
    List<String>? withKeywords,
    List<UnlockdMsdFilter>? withMsd,
  }) =>
      FlutterBluePlus.startScan(
        timeout: timeout,
        androidUsesFineLocation: androidUsesFineLocation ?? false,
        withServices:
            withServices?.map((e) => Guid.fromBytes(e.bytes)).toList() ??
                const [],
        withRemoteIds: withRemoteIds = const [],
        withNames: withNames = const [],
        withKeywords: withKeywords = const [],
        withMsd: withMsd
                ?.map(
                  (e) =>
                      MsdFilter(e.manufacturerId, data: e.data, mask: e.mask),
                )
                .toList() ??
            const [],
      );

  @override
  Future<void> stopScan() => FlutterBluePlus.stopScan();

  @override
  UnlockdBluetoothDevice fromRemoteId(String remoteId) =>
      FbpBluetoothDevice.fromRemoteId(remoteId);

  @override
  Future<List<UnlockdBluetoothDevice>> get systemDevices =>
      FlutterBluePlus.systemDevices
          .then((list) => list.map(FbpBluetoothDevice.fromFbp).toList());

  @override
  Stream<List<UnlockdScanResult>> scanResults() => FlutterBluePlus.scanResults
      .map((list) => list.map(FbpScanResult.fromFbp).toList());

  @override
  Stream<List<UnlockdScanResult>> onScanResults() =>
      FlutterBluePlus.onScanResults
          .map((list) => list.map(FbpScanResult.fromFbp).toList());

  @override
  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription) =>
      FlutterBluePlus.cancelWhenScanComplete(subscription);

  @override
  String get name => 'Flutter blue plus adapter';
}
