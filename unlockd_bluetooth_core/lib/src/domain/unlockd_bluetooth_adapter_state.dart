part of 'domain.dart';

/// The state of the Bluetooth adapter.
enum UnlockdBluetoothAdapterState {
  /// The state of the adapter is unknown.
  unknown,

  /// The adapter is not available.
  unavailable,

  /// Application does not have permission to use the adapter.
  unauthorized,

  /// The adapter is turning on.
  turningOn,

  /// The adapter is on.
  on,

  /// The adapter is turning off.
  turningOff,

  /// The adapter is off.
  off
}
