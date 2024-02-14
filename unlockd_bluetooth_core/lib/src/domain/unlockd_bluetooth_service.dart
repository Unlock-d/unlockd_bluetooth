part of 'domain.dart';

abstract class UnlockdBluetoothService {
  List<UnlockdBluetoothCharacteristic> get characteristics;

  UnlockdGuid get serviceUuid;
}
