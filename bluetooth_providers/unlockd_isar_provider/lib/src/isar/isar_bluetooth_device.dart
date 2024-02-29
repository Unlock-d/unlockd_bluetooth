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
  @Index(unique: true)
  late final String remoteId;

  @override
  String platformName = '';

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
  Stream<int> get mtu => _remoteIdQuery
      .watch(fireImmediately: true)
      .map((devices) => devices.isNotEmpty ? devices[0].mtuNow : 0);

  @ignore
  @override
  Stream<UnlockdBluetoothConnectionState> get connectionState =>
      _remoteIdQuery.watch(fireImmediately: true).map(
            (devices) => devices.isNotEmpty
                ? devices[0].isarConnectionState
                : UnlockdBluetoothConnectionState.disconnected,
          );

  @ignore
  @override
  bool get isConnected =>
      isarConnectionState == UnlockdBluetoothConnectionState.connected;

  @override
  Future<void> connect({
    required Duration timeout,
    bool autoConnect = false,
    int? mtu,
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
  Future<List<UnlockdBluetoothService>> discoverServices() async =>
      isarBluetoothServices.toList();

  @override
  Future<Uint8List> read(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) async {
    final characteristic = _findCharacteristic(serviceUuid, characteristicUuid);

    return characteristic.read();
  }

  @override
  Future<void> write(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid, {
    required Uint8List value,
    bool? withoutResponse,
    bool? allowLongWrite,
  }) async {
    final characteristic = _findCharacteristic(serviceUuid, characteristicUuid);

    await characteristic.write(value);
  }

  @override
  Stream<Uint8List> subscribe(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) {
    final characteristic = _findCharacteristic(serviceUuid, characteristicUuid);

    return characteristic.onValueReceived.map(Uint8List.fromList);
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

  IsarBluetoothCharacteristic _findCharacteristic(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) {
    final service = isarBluetoothServices.firstWhere(
      (element) =>
          element.serviceUuid == IsarGuid.fromString(serviceUuid.str128),
    );

    final characteristic = service.isarCharacteristics.firstWhere(
      (element) =>
          element.characteristicUuid ==
          IsarGuid.fromString(characteristicUuid.str128),
    );

    return characteristic;
  }

  Future<void> _writeDevice(IsarBluetoothDevice updatedDevice) async {
    final isar = IsarBluetoothProvider.instance._isar;
    await isar.writeTxn<void>(
      () => isar.isarBluetoothDevices.put(
        updatedDevice,
      ),
    );
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      get _remoteIdQuery {
    return IsarBluetoothProvider.instance._isar.isarBluetoothDevices
        .filter()
        .remoteIdEqualTo(remoteId);
  }
}
