import 'package:unlockd_bluetooth/src/domain/domain.dart';

abstract class UnlockdBluetoothDevice {
  /// Id of the remote device
  ///   - iOS uses 128-bit uuids the remoteId, e.g. e006b3a7-ef7b-4980-a668-1f8005f84383
  ///   - Android uses 48-bit mac addresses as the remoteId, e.g. 06:E5:28:3B:FD:E0
  String get remoteId;

  /// platform name
  /// - this name is kept track of by the platform
  /// - this name usually persist between app restarts
  /// - iOS: after you connect, iOS uses the GAP name characteristic (0x2A00)
  ///        if it exists. Otherwise iOS use the advertised name.
  /// - Android: always uses the advertised name
  String get platformName;

  /// Advertised Named
  ///  - the is the name advertised by the device during scanning
  ///  - it is only available after you scan with FlutterBluePlus
  ///  - it is cleared when the app restarts.
  ///  - not all devices advertise a name
  String get advName;

  /// The current connection state *of our app* to the device
  Stream<UnlockdBluetoothConnectionState> get connectionState;

  /// The current MTU size in bytes
  int get mtuNow;

  /// Stream emits a value:
  ///   - immediately when first listened to
  ///   - whenever the mtu changes
  Stream<int> get mtu;

  /// Get services
  ///  - returns empty if discoverServices() has not been called
  ///    or if your device does not have any services (rare)
  List<UnlockdBluetoothService> get servicesList;

  /// Establishes a connection to the Bluetooth Device.
  ///   [timeout] if timeout occurs, cancel the connection request and throw exception
  ///   [mtu] Android only. Request a larger mtu right after connection, if set.
  ///   [autoConnect] reconnect whenever the device is found
  ///      - if true, this function always returns immediately.
  ///      - you must listen to `connectionState` to know when connection occurs.
  ///      - auto connect is turned off by calling `disconnect`
  ///      - auto connect results in a slower connection process compared to a direct connection
  ///        because it relies on the internal scheduling of background scans.
  Future<void> connect({required Duration timeout});

  /// Cancels connection to the Bluetooth Device
  ///   - [queue] If true, this disconnect request will be executed after all other operations complete.
  ///     If false, this disconnect request will be executed right now, i.e. skipping to the front
  ///     of the fbp operation queue, which is useful to cancel an in-progress connection attempt.
  Future<void> disconnect();

  /// Request to change MTU (Android Only)
  ///  - returns new MTU
  ///  - [predelay] adds delay to avoid race conditions on some devices. see comments below.
  Future<void> requestMtu(int mtu);

  /// Read the RSSI of connected remote device
  Future<int> readRssi();

  Future<List<UnlockdBluetoothService>> discoverServices();
}
