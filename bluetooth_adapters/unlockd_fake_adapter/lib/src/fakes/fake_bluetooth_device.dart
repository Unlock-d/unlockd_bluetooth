part of 'fakes.dart';

/// A configuration class for the DFU Process.
class DFUProcessConfiguration {
  /// Creates a [DFUProcessConfiguration],
  const DFUProcessConfiguration({
    this.shouldAbortDfu = false,
    this.updateDuration = const Duration(seconds: 1),
    this.amountOfProgressSteps = 10,
  });

  /// Whether the DFU process should be aborted.
  final bool shouldAbortDfu;

  /// The duration of the update process.
  final Duration updateDuration;

  /// The amount of times the progress should be updated.
  final int amountOfProgressSteps;
}

/// A configuration class for the connection.
class ConnectionConfiguration {
  /// Creates a [ConnectionConfiguration].
  const ConnectionConfiguration({
    this.initialConnectionState = UnlockdBluetoothConnectionState.disconnected,
    this.shouldFailConnecting = false,
    this.shouldTimeout = false,
  });

  /// The initial connection state.
  final UnlockdBluetoothConnectionState initialConnectionState;

  /// Whether the connection should fail.
  final bool shouldFailConnecting;

  /// Whether the connection should timeout.
  final bool shouldTimeout;
}

/// A [Fake] implementation of [UnlockdBluetoothDevice].
class FakeBluetoothDevice extends Fake implements UnlockdBluetoothDevice {
  /// Creates a [FakeBluetoothDevice] with the given configuration.
  FakeBluetoothDevice({
    required this.remoteId,
    required this.platformName,
    this.dfuProcessConfiguration = const DFUProcessConfiguration(),
    this.connectionConfiguration = const ConnectionConfiguration(),
  })  : connectionController = StreamController.broadcast(),
        subscriptionController = StreamController.broadcast(),
        _connectionStateNow = connectionConfiguration.initialConnectionState {
    connectionController.stream.listen((event) {
      _connectionStateNow = event;
    });
  }

  /// A [StreamController] to manipulate the connection state.
  final StreamController<UnlockdBluetoothConnectionState> connectionController;

  /// A [StreamController] to manipulate a subscription.
  final StreamController<Uint8List> subscriptionController;

  /// The configuration for the DFU process.
  final DFUProcessConfiguration dfuProcessConfiguration;

  /// The configuration for the connection.
  final ConnectionConfiguration connectionConfiguration;

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
  Future<void> connect({
    required Duration timeout,
    bool autoConnect = false,
    int? mtu,
  }) async {
    if (!isConnected) {
      if (connectionConfiguration.shouldFailConnecting) {
        connectionController.add(UnlockdBluetoothConnectionState.disconnected);
        throw Exception('Failed to connect');
      }

      if (connectionConfiguration.shouldTimeout) {
        await Future<void>.delayed(timeout);
        throw Exception('Connection timed out');
      }

      connectionController.add(UnlockdBluetoothConnectionState.connected);
    }
  }

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
    final amountOfSteps = dfuProcessConfiguration.amountOfProgressSteps;
    final timerInterval = Duration(
      milliseconds: dfuProcessConfiguration.updateDuration.inMilliseconds ~/
          amountOfSteps,
    );
    var currentStep = 1;

    if (!isConnected) {
      onConnecting?.call(remoteId);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      onConnected?.call(remoteId);
    }

    Timer.periodic(timerInterval, (timer) async {
      if (currentStep == amountOfSteps) {
        onProgressChanged(
          remoteId,
          100,
          100,
          33.3,
          timer.tick,
          amountOfSteps,
        );

        timer.cancel();

        if (dfuProcessConfiguration.shouldAbortDfu) {
          onAborted?.call(remoteId);
        } else {
          onCompleted?.call(remoteId);
        }

        onDisconnecting?.call(remoteId);
        await Future<void>.delayed(const Duration(milliseconds: 50));
        onDisconnected?.call(remoteId);
      } else {
        if (currentStep == 1) {
          onProcessStarting?.call(remoteId);
          await Future<void>.delayed(const Duration(milliseconds: 50));
          onProcessStarted?.call(remoteId);
        }

        onProgressChanged(
          remoteId,
          (100 ~/ amountOfSteps) * currentStep,
          100,
          33.3,
          timer.tick,
          amountOfSteps,
        );
        currentStep++;
      }
    });
  }
}
