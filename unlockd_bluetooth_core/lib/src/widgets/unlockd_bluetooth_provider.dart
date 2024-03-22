import 'package:provider/provider.dart';
import 'package:unlockd_bluetooth_core/unlockd_bluetooth.dart';

class UnlockdBluetoothProvider extends Provider<UnlockdBluetoothController> {
  UnlockdBluetoothProvider({
    required UnlockdBluetoothController bluetoothController,
    super.builder,
    super.child,
    super.lazy,
    super.key,
  }) : super(
          create: (_) => bluetoothController,
          dispose: (_, controller) => controller.close(),
        );
}
