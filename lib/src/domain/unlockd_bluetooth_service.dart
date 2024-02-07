part of 'domain.dart';

abstract class UnlockdBluetoothService {
  List<UnlockdBluetoothCharacteristic> get characteristics;

  String get serviceUuid;
}
