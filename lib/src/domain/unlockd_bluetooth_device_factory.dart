import 'package:unlockd_bluetooth/src/domain/domain.dart';
import 'package:unlockd_bluetooth/src/fbp/fbp.dart';

abstract class UnlockdBluetoothDeviceFactory {
  static UnlockdBluetoothDevice fromRemoteId(String remoteId) {
    return FbpBluetoothDevice.fromRemoteId(remoteId);
  }
}
