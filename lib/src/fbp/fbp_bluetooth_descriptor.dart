import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:unlockd_bluetooth/src/domain/domain.dart';

class FbpBluetoothDescriptor extends UnlockdBluetoothDescriptor {
  FbpBluetoothDescriptor._(this._descriptor);

  factory FbpBluetoothDescriptor.fromFbp(BluetoothDescriptor descriptor) {
    return FbpBluetoothDescriptor._(descriptor);
  }

  final BluetoothDescriptor _descriptor;

  @override
  String get descriptorUuid => _descriptor.descriptorUuid.str128;

  @override
  List<int> get lastValue => _descriptor.lastValue;

  @override
  Stream<List<int>> get onValueReceived => _descriptor.onValueReceived;

  @override
  Future<List<int>> read() => _descriptor.read();

  @override
  Future<void> write(List<int> value) => _descriptor.write(value);
}
