import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logging/logging.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_flutter_blue_plus_adapter/unlockd_flutter_blue_plus_adapter.dart';

/// A [UnlockdBluetoothDevice] implementation for the [FlutterBluePlus] package.
class FbpBluetoothDevice extends UnlockdBluetoothDevice {
  FbpBluetoothDevice._(this._device) {
    _logger = Logger(_device.remoteId.str);
  }

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
  List<UnlockdBluetoothService>? _services;
  late final Logger _logger;

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
    int? mtu,
  }) =>
      _device
          .connect(
            timeout: timeout,
            autoConnect: autoConnect,
            mtu: mtu,
          )
          .then((_) => _services = null);

  @override
  Future<void> disconnect() => _device.disconnect();

  @override
  Future<void> requestMtu(int mtu) => _device.requestMtu(mtu);

  @override
  Future<int> readRssi() => _device.readRssi();

  @override
  Future<List<UnlockdBluetoothService>> discoverServices() async {
    _logger.finest('Discovering services');

    _services = await _device
        .discoverServices()
        .then((value) => value.map(FbpBluetoothService.fromFbp).toList());

    return _services!;
  }

  @override
  Future<Uint8List> read(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) async {
    final stopwatch = Stopwatch()..start();
    _logger.finest(
      'Reading $characteristicUuid on $serviceUuid',
      stopwatch.elapsed,
    );
    final characteristic =
        await _findCharacteristic(serviceUuid, characteristicUuid);
    _logger.finest(
      'Going to read $characteristicUuid',
      stopwatch.elapsed,
    );

    final result = await characteristic.read();

    _logger.finest(
      'Read $characteristicUuid, got value $result',
      stopwatch.elapsed,
    );
    stopwatch.stop();

    return result;
  }

  @override
  Future<void> write(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid, {
    required Uint8List value,
    bool? withoutResponse,
    bool? allowLongWrite,
  }) async {
    final characteristic =
        await _findCharacteristic(serviceUuid, characteristicUuid);

    await characteristic.write(
      value,
      withoutResponse: withoutResponse,
      allowLongWrite: allowLongWrite,
    );
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
    final service = (_services ?? await discoverServices())
        .firstWhere((service) => service.serviceUuid == serviceUuid);

    _logger.finest('Found service $serviceUuid');

    final characteristic = service.characteristics.firstWhere(
      (characteristic) =>
          characteristic.characteristicUuid == characteristicUuid,
    );

    _logger.finest('Found characteristic $characteristicUuid');

    return characteristic;
  }
}
