import 'package:unlockd_bluetooth/src/domain/domain.dart';

abstract class UnlockdBluetoothService {
  /// Id of the remote service
  String get uuid;

  List<UnlockdBluetoothCharacteristic> get characteristics;

  String get serviceUuid;
}
