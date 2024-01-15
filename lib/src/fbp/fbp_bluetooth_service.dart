import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';
import 'package:unlockd_bluetooth/src/fbp/fbp.dart';

class FbpBluetoothService extends UnlockdBluetoothService {
  FbpBluetoothService._(this._service);

  factory FbpBluetoothService.fromFbp(BluetoothService service) {
    return FbpBluetoothService._(service);
  }

  final BluetoothService _service;

  @override
  String get uuid => _service.uuid.str128;

  @override
  String get serviceUuid => _service.serviceUuid.str128;

  @override
  List<UnlockdBluetoothCharacteristic> get characteristics =>
      _service.characteristics.map(FbpBluetoothCharacteristic.fromFbp).toList();
}
