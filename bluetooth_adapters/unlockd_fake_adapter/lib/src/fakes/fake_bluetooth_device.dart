part of 'fakes.dart';

/// A [Fake] implementation of [UnlockdBluetoothDevice].
class FakeBluetoothDevice extends Fake implements UnlockdBluetoothDevice {
  /// Creates a [FakeBluetoothDevice] with the given [initialConnectionState]
  /// and [connectionController].
  FakeBluetoothDevice({
    required this.remoteId,
    required this.platformName,
    UnlockdBluetoothConnectionState initialConnectionState =
        UnlockdBluetoothConnectionState.disconnected,
  })  : connectionController = StreamController.broadcast(),
        subscriptionController = StreamController.broadcast(),
        _connectionStateNow = initialConnectionState {
    connectionController.stream.listen((event) {
      _connectionStateNow = event;
    });
  }

  /// A [StreamController] to manipulate the connection state.
  final StreamController<UnlockdBluetoothConnectionState> connectionController;

  /// A [StreamController] to manipulate a subscription.
  final StreamController<Uint8List> subscriptionController;

  UnlockdBluetoothConnectionState _connectionStateNow;

  @override
  final String remoteId;

  @override
  final String platformName;

  @override
  bool get isConnected =>
      _connectionStateNow == UnlockdBluetoothConnectionState.connected;

  @override
  Stream<UnlockdBluetoothConnectionState> get connectionState =>
      connectionController.stream;

  @override
  Future<void> write(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid, {
    required Uint8List value,
    bool? withoutResponse,
    bool? allowLongWrite,
  }) async {}

  @override
  Stream<Uint8List> subscribe(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  ) =>
      subscriptionController.stream;

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
}
