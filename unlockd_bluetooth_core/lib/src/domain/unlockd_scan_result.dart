part of 'domain.dart';
abstract class UnlockdScanResult {
  UnlockdBluetoothDevice get device;

  int get rssi;

  UnlockdAdvertisementData get advertisementData;
}
