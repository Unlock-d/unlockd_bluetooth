part of 'isar.dart';

/// [UnlockdBluetoothDevice] which uses [Isar] as the underlying storage.
@Collection(inheritance: false)
class IsarBluetoothDevice extends UnlockdBluetoothDevice {
  /// Internal [Isar] id.
  Id id = Isar.autoIncrement;

  /// [IsarLink] to [IsarBluetoothConfig].
  final IsarLink<IsarBluetoothConfig> config = IsarLink();

  /// [Backlink] to [IsarScanResult].
  @Backlink(to: 'isarBluetoothDevice')
  final IsarLink<IsarScanResult> result = IsarLink();

  /// [IsarLinks] of [IsarBluetoothService].
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

  /// Internal [Isar] rssi.
  int isarRssi = 0;

  /// Internal [Isar] connection state.
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

  @ignore
  @override
  bool get isConnected =>
      isarConnectionState == UnlockdBluetoothConnectionState.connected;

  @override
  Future<void> connect({
    required Duration timeout,
    bool autoConnect = false,
  }) async {
    final updatedDevice = this
      ..isarConnectionState = UnlockdBluetoothConnectionState.connected;

    await _writeDevice(updatedDevice);
  }

  @override
  Future<void> disconnect() async {
    final updatedDevice = this
      ..isarConnectionState = UnlockdBluetoothConnectionState.disconnected;

    await _writeDevice(updatedDevice);
  }

  @override
  Future<void> requestMtu(int mtu) async {
    final updatedDevice = this..mtuNow = mtu;

    await _writeDevice(updatedDevice);
  }

  @override
  Future<int> readRssi() async => isarRssi;

  @override
  Future<List<UnlockdBluetoothService>> discoverServices() async {
    return servicesList;
  }

  @override
  Future<void> performUpdate(
    FirmwarePackage firmwarePackage, {
    required ProgressCallback onProgressChanged,
    DeviceCallback? onConnected,
    DeviceCallback? onConnecting,
    DeviceCallback? onDisconnected,
    DeviceCallback? onDisconnecting,
    DeviceCallback? onAborted,
    DeviceCallback? onCompleted,
    DeviceCallback? onProcessStarted,
    DeviceCallback? onProcessStarting,
    int timeout = 10,
  }) async {
    var counter = 3;

    Timer.periodic(Duration(seconds: counter), (timer) {
      if (counter == 0) {
        timer.cancel();
      } else {
        onProgressChanged(
          remoteId,
          timer.tick * 10,
          100,
          33.3,
          timer.tick,
          counter,
        );
        counter--;
      }
    });
  }

  Future<void> _writeDevice(IsarBluetoothDevice updatedDevice) async {
    final isar = IsarBluetoothProvider.instance._isar;
    await isar.writeTxn<void>(
      () => isar.isarBluetoothDevices.put(
        updatedDevice,
      ),
    );
  }
}
