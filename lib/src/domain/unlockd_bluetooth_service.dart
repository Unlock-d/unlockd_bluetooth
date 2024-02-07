import 'package:unlockd_bluetooth/src/domain/domain.dart';

abstract class UnlockdBluetoothService {
  List<UnlockdBluetoothCharacteristic> get characteristics;

  String get serviceUuid;
}
