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
    this.shouldFailWriting = false,
    this.shouldTimeout = false,
  });

  /// The initial connection state.
  final UnlockdBluetoothConnectionState initialConnectionState;

  /// Whether the connection should fail.
  final bool shouldFailConnecting;

  /// Whether the writing to a characteristic should fail.
  final bool shouldFailWriting;

  /// Whether the connection should timeout.
  final bool shouldTimeout;
}

