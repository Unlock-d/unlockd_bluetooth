import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_flutter_blue_plus_adapter/unlockd_flutter_blue_plus_adapter.dart';

class FbpBluetoothService extends UnlockdBluetoothService {
  FbpBluetoothService._(this._service);

  factory FbpBluetoothService.fromFbp(BluetoothService service) {
    return FbpBluetoothService._(service);
  }

  final BluetoothService _service;

  @override
  UnlockdGuid get serviceUuid =>
      UnlockdGuid.fromBytes(_service.serviceUuid.bytes);

  @override
  List<UnlockdBluetoothCharacteristic> get characteristics =>
      _service.characteristics.map(FbpBluetoothCharacteristic.fromFbp).toList();
}
