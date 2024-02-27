part of 'fakes.dart';

/// A [Fake] implementation of [UnlockdBluetoothDevice].
class FakeBluetoothDevice extends Fake implements UnlockdBluetoothDevice {
  /// Creates a [FakeBluetoothDevice] with the given [initialConnectionState]
  /// and [connectionController].
  FakeBluetoothDevice({
    required this.remoteId,
    required this.platformName,
    UnlockdBluetoothConnectionState? initialConnectionState,
    StreamController<UnlockdBluetoothConnectionState>? connectionController,
  })  : _connectionController =
            connectionController ?? StreamController.broadcast(),
        _initialConnectionState = initialConnectionState;

  final StreamController<UnlockdBluetoothConnectionState> _connectionController;
  final UnlockdBluetoothConnectionState? _initialConnectionState;

  @override
  final String remoteId;

  @override
  final String platformName;

  @override
  bool get isConnected =>
      _initialConnectionState == UnlockdBluetoothConnectionState.connected;

  @override
  Stream<UnlockdBluetoothConnectionState> get connectionState async* {
    if (_initialConnectionState != null) {
      yield _initialConnectionState!;
    }
    yield* _connectionController.stream;
  }
}
