import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';
import 'package:unlockd_flutter_blue_plus_adapter/src/fbp/fbp.dart';

/// [UnlockdBluetoothCharacteristic] which uses [FlutterBluePlus]
/// to retrieve characteristic information.
class FbpBluetoothCharacteristic extends UnlockdBluetoothCharacteristic {
  FbpBluetoothCharacteristic._(this._characteristic);

  /// Create a [FbpBluetoothCharacteristic] from a [BluetoothCharacteristic]
  factory FbpBluetoothCharacteristic.fromFbp(
    BluetoothCharacteristic characteristic,
  ) {
    return FbpBluetoothCharacteristic._(characteristic);
  }

  final BluetoothCharacteristic _characteristic;

  @override
  UnlockdCharacteristicProperties get properties =>
      FbpCharacteristicProperties.fromFbp(_characteristic.properties);

  @override
  bool get isNotifying => _characteristic.isNotifying;

  @override
  UnlockdGuid get characteristicUuid =>
      UnlockdGuid.fromBytes(_characteristic.characteristicUuid.bytes);

  @override
  Stream<Uint8List> get onValueReceived =>
      _characteristic.lastValueStream.map(Uint8List.fromList);

  @override
  List<int> get lastValue => _characteristic.lastValue;

  @override
  List<UnlockdBluetoothDescriptor> get descriptors =>
      _characteristic.descriptors.map(FbpBluetoothDescriptor.fromFbp).toList();

  @override
  Future<Uint8List> read() => _characteristic.read().then(Uint8List.fromList);

  @override
  Future<void> write(
    Uint8List value, {
    bool? withoutResponse,
    bool? allowLongWrite,
  }) =>
      _characteristic.write(
        value,
        withoutResponse: withoutResponse ?? false,
        allowLongWrite: allowLongWrite ?? false,
      );

  @override
  Future<bool> setNotifyValue({required bool value}) =>
      _characteristic.setNotifyValue(value);
}
