import 'package:unlockd_bluetooth/src/domain/domain.dart';

abstract class UnlockdScanResult {
  UnlockdBluetoothDevice get device;

  int get rssi;

  UnlockdAdvertisementData get advertisementData;
}
