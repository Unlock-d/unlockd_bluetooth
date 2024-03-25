part of 'fakes.dart';

/// A [Fake] implementation of [UnlockdBluetoothDevice].
class FakeBluetoothDevice extends Fake implements UnlockdBluetoothDevice {
  /// Creates a [FakeBluetoothDevice] with the given [initialConnectionState]
  /// and [connectionController].
  FakeBluetoothDevice({
    required this.remoteId,
    required this.platformName,
    bool shouldAbortDfu = false,
    UnlockdBluetoothConnectionState initialConnectionState =
        UnlockdBluetoothConnectionState.disconnected,
  })  : connectionController = StreamController.broadcast(),
        subscriptionController = StreamController.broadcast(),
        _shouldAbortDfu = shouldAbortDfu,
        _connectionStateNow = initialConnectionState {
    connectionController.stream.listen((event) {
      _connectionStateNow = event;
    });
  }

  /// A [StreamController] to manipulate the connection state.
  final StreamController<UnlockdBluetoothConnectionState> connectionController;

  /// A [StreamController] to manipulate a subscription.
  final StreamController<Uint8List> subscriptionController;

  final bool _shouldAbortDfu;
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
    const initialCounter = 10;
    var counter = initialCounter;

    onConnecting?.call(remoteId);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    onConnected?.call(remoteId);

    Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      if (counter == 0) {
        timer.cancel();

        if (_shouldAbortDfu) {
          onAborted?.call(remoteId);
        } else {
          onCompleted?.call(remoteId);
        }

        onDisconnecting?.call(remoteId);
        await Future<void>.delayed(const Duration(milliseconds: 50));
        onDisconnected?.call(remoteId);
      } else {
        if (counter == initialCounter) {
          onProcessStarting?.call(remoteId);
          await Future<void>.delayed(const Duration(milliseconds: 50));
          onProcessStarted?.call(remoteId);
        }

        onProgressChanged(
          remoteId,
          timer.tick * 10,
          100,
          33.3,
          timer.tick,
          initialCounter,
        );
        counter--;
      }
    });
  }
}
