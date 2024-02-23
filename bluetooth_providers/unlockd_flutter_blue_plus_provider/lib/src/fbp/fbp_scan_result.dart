import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_flutter_blue_plus_provider/src/fbp/fbp.dart';

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
