part of 'domain.dart';

/// The result of a scan.
abstract class UnlockdScanResult {
  /// The device found during the scan.
  UnlockdBluetoothDevice get device;

  /// Received signal strength indicator
  int get rssi;

  /// The advertisement data received from the device.
  UnlockdAdvertisementData get advertisementData;
}
