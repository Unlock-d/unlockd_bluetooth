import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';
import 'package:unlockd_bluetooth/src/fbp/fbp.dart';

class FbpBluetoothDevice extends UnlockdBluetoothDevice {
  FbpBluetoothDevice._(this._device);

  factory FbpBluetoothDevice.fromFbp(BluetoothDevice device) {
    return FbpBluetoothDevice._(device);
  }

  factory FbpBluetoothDevice.fromRemoteId(String remoteId) {
    return FbpBluetoothDevice._(BluetoothDevice.fromId(remoteId));
  }

  final BluetoothDevice _device;

  @override
  String get remoteId => _device.remoteId.str;

  @override
  String get platformName => _device.platformName;

  @override
  String get advName => _device.advName;

  @override
  int get mtuNow => _device.mtuNow;

  @override
  Stream<int> get mtu => _device.mtu;

  @override
  Stream<UnlockdBluetoothConnectionState> get connectionState =>
      _device.connectionState.map((event) {
        switch (event) {
          case BluetoothConnectionState.disconnecting:
          case BluetoothConnectionState.disconnected:
            return UnlockdBluetoothConnectionState.disconnected;
          case BluetoothConnectionState.connecting:
          case BluetoothConnectionState.connected:
            return UnlockdBluetoothConnectionState.connected;
        }
      });

  @override
  List<UnlockdBluetoothService> get servicesList =>
      _device.servicesList.map(FbpBluetoothService.fromFbp).toList();

  @override
  Future<void> connect({
    required Duration timeout,
    bool autoConnect = false,
  }) =>
      _device.connect(timeout: timeout);

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
}
