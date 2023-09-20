part of '../../unlockd_bluetooth.dart';

class EmulatorBluePlus {
  EmulatorBluePlus._();

  static Stream<UnlockdBluetoothAdapterState> get adapterState async* {
    await for (final event in watchConfig()) {
      yield UnlockdBluetoothAdapterState.on;
    }
  }

  static bool get isScanningNow => FlutterBluePlus.isScanningNow;

  static Stream<bool> get isScanning => FlutterBluePlus.isScanning;

  static Future<ConnectedBluetoothDevices> get connectedSystemDevices =>
      FlutterBluePlus.connectedSystemDevices;

  static TurnOn get turnOn => FlutterBluePlus.turnOn;

  static StartScan get startScan => FlutterBluePlus.startScan;

  static StopScan get stopScan => FlutterBluePlus.stopScan;

  static Stream<ScanResults> get scanResults => FlutterBluePlus.scanResults;
}
