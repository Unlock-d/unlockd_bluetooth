import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_flutter_blue_plus_provider/unlockd_flutter_blue_plus_provider.dart';

/// A [UnlockdBluetoothDevice] implementation for the [FlutterBluePlus] package.
class FbpBluetoothDevice extends UnlockdBluetoothDevice {
  FbpBluetoothDevice._(this._device);

  /// Creates a [FbpBluetoothDevice] from a [BluetoothDevice].
  factory FbpBluetoothDevice.fromFbp(BluetoothDevice device) {
    return FbpBluetoothDevice._(device);
  }

  /// Creates a [FbpBluetoothDevice] from a remote id.
  ///
  ///   - to connect, this device must have been discovered
  ///   by your app in a previous scan
  ///   - iOS uses 128-bit uuids the remoteId,
  ///   e.g. e006b3a7-ef7b-4980-a668-1f8005f84383
  ///   - Android uses 48-bit mac addresses as the remoteId,
  ///   e.g. 06:E5:28:3B:FD:E0
  factory FbpBluetoothDevice.fromRemoteId(String remoteId) {
    return FbpBluetoothDevice._(BluetoothDevice.fromId(remoteId));
  }

  final BluetoothDevice _device;

  @override
  String get remoteId => _device.remoteId.str;

  @override
  String get platformName => _device.platformName;

  @override
  int get mtuNow => _device.mtuNow;

  @override
  Stream<int> get mtu => _device.mtu;

  @override
  Stream<UnlockdBluetoothConnectionState> get connectionState =>
      _device.connectionState.map((event) {
        switch (event) {
          // ignore: deprecated_member_use
          case BluetoothConnectionState.disconnecting:
          case BluetoothConnectionState.disconnected:
            return UnlockdBluetoothConnectionState.disconnected;
          // ignore: deprecated_member_use
          case BluetoothConnectionState.connecting:
          case BluetoothConnectionState.connected:
            return UnlockdBluetoothConnectionState.connected;
        }
      });

  @override
  bool get isConnected => _device.isConnected;

  @override
  Future<void> connect({
    required Duration timeout,
    bool autoConnect = false,
  }) =>
      _device.connect(
        timeout: timeout,
        autoConnect: autoConnect,
        mtu: null,
      );

  @override
  Future<void> disconnect() => _device.disconnect();

  @override
  Future<void> requestMtu(int mtu) => _device.requestMtu(mtu);

  @override
  Future<int> readRssi() => _device.readRssi();

  @override
  Future<List<UnlockdBluetoothService>> discoverServices() {
    return _device
        .discoverServices()
        .then((value) => value.map(FbpBluetoothService.fromFbp).toList());
  }

  @override
  Future<Uint8List> read(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) async {
    final characteristic =
        await _findCharacteristic(serviceUuid, characteristicUuid);

    return characteristic.read();
  }

  @override
  Future<void> write(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid, {
    required Uint8List value,
    bool? withoutResponse,
  }) async {
    final characteristic =
        await _findCharacteristic(serviceUuid, characteristicUuid);

    await characteristic.write(value, withoutResponse: withoutResponse);
  }

  @override
  Stream<Uint8List> subscribe(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) async* {
    final characteristic =
        await _findCharacteristic(serviceUuid, characteristicUuid);

    await characteristic.setNotifyValue(value: true);

    yield* characteristic.onValueReceived.map(Uint8List.fromList);
  }

  @override
  Future<void> performUpdate(
    FirmwarePackage firmwarePackage, {
    required ProgressCallback onProgressChanged,
    DeviceCallback? onConnected,
    DeviceCallback? onConnecting,
    DeviceCallback? onDisconnected,
    DeviceCallback? onDisconnecting,
    DeviceCallback? onAborted,
    DeviceCallback? onCompleted,
    DeviceCallback? onProcessStarted,
    DeviceCallback? onProcessStarting,
    int timeout = 10,
  }) async {
    await DfuService.instance().performUpdate(
      remoteId,
      firmwarePackage,
      onProgressChanged: onProgressChanged,
      onCompleted: onCompleted,
      onConnected: onConnected,
      onConnecting: onConnecting,
      onDisconnected: onDisconnected,
      onDisconnecting: onDisconnecting,
      onAborted: onAborted,
      onProcessStarted: onProcessStarted,
      onProcessStarting: onProcessStarting,
    );
  }

  Future<UnlockdBluetoothCharacteristic> _findCharacteristic(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) async {
    final service = await discoverServices().then(
      (services) => services.firstWhere(
        (service) => service.serviceUuid == serviceUuid,
      ),
    );

    final characteristic = service.characteristics.firstWhere(
      (characteristic) =>
          characteristic.characteristicUuid == characteristicUuid,
    );

    return characteristic;
  }
}
