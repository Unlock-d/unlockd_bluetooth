part of 'isar.dart';

@Collection(inheritance: false)
class IsarBluetoothDevice extends UnlockdBluetoothDevice {
  Id id = Isar.autoIncrement;

  final IsarLink<IsarBluetoothConfig> config = IsarLink();

  @Backlink(to: 'isarBluetoothDevice')
  final IsarLink<IsarScanResult> result = IsarLink();

  final IsarLinks<IsarBluetoothService> isarBluetoothServices =
      IsarLinks<IsarBluetoothService>();

  @override
  String remoteId = '';

  @override
  String platformName = '';

  @override
  String advName = '';

  @override
  int mtuNow = 0;

  int rssi = 0;

  @enumerated
  UnlockdBluetoothConnectionState isarConnectionState =
      UnlockdBluetoothConnectionState.disconnected;

  @ignore
  @override
  Stream<int> get mtu => Stream.value(mtuNow);

  @ignore
  @override
  Stream<UnlockdBluetoothConnectionState> get connectionState =>
      Stream.value(isarConnectionState);

  @ignore
  @override
  List<UnlockdBluetoothService> get servicesList =>
      isarBluetoothServices.toList();

  @override
  Future<void> connect({
    required Duration timeout,
    bool autoConnect = false,
  }) async {
    final updatedDevice = this
      ..isarConnectionState = UnlockdBluetoothConnectionState.connected;

    final isar = UnlockdBluetooth.instance.isar;
    if (isar != null) {
      await isar.writeTxn(() => isar.isarBluetoothDevices.put(updatedDevice));
    }
  }

  @override
  Future<void> disconnect() async {
    final updatedDevice = this
      ..isarConnectionState = UnlockdBluetoothConnectionState.disconnected;

    final isar = UnlockdBluetooth.instance.isar;
    if (isar != null) {
      await isar.writeTxn(() => isar.isarBluetoothDevices.put(updatedDevice));
    }
  }

  @override
  Future<void> requestMtu(int mtu) async {
    final updatedDevice = this..mtuNow = mtu;

    final isar = UnlockdBluetooth.instance.isar;
    if (isar != null) {
      await isar.writeTxn(() => isar.isarBluetoothDevices.put(updatedDevice));
    }
  }

  @override
  Future<int> readRssi() async => rssi;

  @override
  Future<List<UnlockdBluetoothService>> discoverServices() async {
    return servicesList;
  }
}
