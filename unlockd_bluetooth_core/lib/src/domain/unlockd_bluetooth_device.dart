part of 'domain.dart';

/// Callback for when dfu status has changed
/// [deviceAddress] Device with error
typedef DeviceCallback = void Function(String deviceAddress);

/// Callback for when the dfu progress has changed
/// [deviceAddress] Device with dfu
/// [percent] Percentage dfu completed
/// [speed] Speed of the dfu proces
/// [avgSpeed] Average speed of the dfu process
/// [currentPart] Current part being uploaded
/// [partsTotal] All parts that need to be uploaded
typedef ProgressCallback = void Function(
  String deviceAddress,
  int percent,
  double speed,
  double avgSpeed,
  int currentPart,
  int partsTotal,
);

/// Represents a Bluetooth Device
abstract class UnlockdBluetoothDevice {
  /// Id of the remote device
  ///   - iOS uses 128-bit uuids the remoteId,
  ///   e.g. e006b3a7-ef7b-4980-a668-1f8005f84383
  ///   - Android uses 48-bit mac addresses as the remoteId,
  ///   e.g. 06:E5:28:3B:FD:E0
  String get remoteId;

  /// platform name
  /// - this name is kept track of by the platform
  /// - this name usually persist between app restarts
  /// - iOS: after you connect, iOS uses the GAP name characteristic (0x2A00)
  ///        if it exists. Otherwise iOS use the advertised name.
  /// - Android: always uses the advertised name
  String get platformName;

  /// The current connection state *of our app* to the device
  Stream<UnlockdBluetoothConnectionState> get connectionState;

  /// Returns true if this device currently connected to your app
  bool get isConnected;

  /// The current MTU size in bytes
  int get mtuNow;

  /// Stream emits a value:
  ///   - immediately when first listened to
  ///   - whenever the mtu changes
  Stream<int> get mtu;

  /// Establishes a connection to the Bluetooth Device.
  ///   [timeout] if timeout occurs, cancel the connection request
  ///   and throw exception
  ///   [mtu] Android only. Request a larger mtu right after connection, if set.
  ///   [autoConnect] reconnect whenever the device is found
  ///      - if true, this function always returns immediately.
  ///      - you must listen to `connectionState` to know when connection
  ///      occurs.
  ///      - auto connect is turned off by calling `disconnect`
  ///      - auto connect results in a slower connection process compared
  ///      to a direct connection because it relies on the internal scheduling
  ///      of background scans.
  Future<void> connect({
    required Duration timeout,
    bool autoConnect = false,
  });

  /// Cancels connection to the Bluetooth Device
  Future<void> disconnect();

  /// Request to change MTU (Android Only)
  ///  - returns new MTU
  Future<void> requestMtu(int mtu);

  /// Read the RSSI of connected remote device
  Future<int> readRssi();

  /// Discover services, characteristics, and descriptors of the remote device
  Future<List<UnlockdBluetoothService>> discoverServices();

  /// Read a value of a characteristic
  Future<Uint8List> read(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  );

  /// Write a value to a characteristic
  Future<void> write(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid, {
    required Uint8List value,
  });

  /// Subscribe to a characteristic
  Stream<Uint8List> subscribe(
    UnlockdGuid serviceUuid,
    UnlockdGuid characteristicUuid,
  );

  /// Start the DFU Process.
  /// Required:
  /// [firmwarePackage] zip file path
  ///
  /// Optional:
  ///
  /// Callbacks:
  /// [onConnected] Callback for when device is connected
  /// [onConnecting] Callback for when device is connecting
  /// [onDisconnected] Callback for when device is disconnected
  /// [onDisconnecting] Callback for when device is disconnecting
  /// [onAborted] Callback for dfu is Aborted
  /// [onCompleted] Callback for when dfu is completed
  /// [onProcessStarted] Callback for when dfu has been started
  /// [onProcessStarting] Callback for when dfu is starting
  /// [onProgressChanged] Callback for when the dfu progress has changed
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
  });
}
