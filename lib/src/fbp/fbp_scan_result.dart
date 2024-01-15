import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_bluetooth_device.dart';
import 'package:unlockd_bluetooth/src/domain/unlockd_scan_result.dart';
import 'package:unlockd_bluetooth/src/fbp/fbp.dart';

class FbpScanResult extends UnlockdScanResult {
  FbpScanResult._(this._scanResult);

  factory FbpScanResult.fromFbp(ScanResult scanResult) {
    return FbpScanResult._(scanResult);
  }

  final ScanResult _scanResult;

  @override
  UnlockdBluetoothDevice get device =>
      FbpBluetoothDevice.fromFbp(_scanResult.device);

  @override
  int get rssi => _scanResult.rssi;

  @override
  UnlockdAdvertisementData get advertisementData =>
      FbpAdvertisementData.fromFbp(_scanResult.advertisementData);
}
