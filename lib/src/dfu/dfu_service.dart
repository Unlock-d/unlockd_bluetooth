part of 'dfu.dart';

/// Service for performing Device Firmware Update (DFU) operations.
class DfuService {
  DfuService._(this._nordicDfu);

  /// Returns the singleton instance of [DfuService].
  factory DfuService.instance({NordicDfu? nordicDfu}) {
    _instance ??= DfuService._(nordicDfu ?? NordicDfu());
    return _instance!;
  }

  static DfuService? _instance;

  final NordicDfu _nordicDfu;
  final Logger _logger = Logger('$DfuService');

  /// Performs a firmware update on the device with the given [remoteId].
  /// Wrapper function around [NordicDfu.startDfu].
  Future<void> performUpdate(
    String remoteId,
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
    final countdownTimer = Timer(Duration(seconds: timeout), () async {
      await _nordicDfu.abortDfu();
    });

    await _nordicDfu.startDfu(
      remoteId,
      firmwarePackage.getPath(),
      fileInAsset: firmwarePackage is LocalFirmwarePackage,
      onProgressChanged: onProgressChanged,
      onDfuCompleted: onCompleted ?? _defaultCallback,
      onDeviceConnected: onConnected ?? _defaultCallback,
      onDeviceConnecting: onConnecting ?? _defaultCallback,
      onDeviceDisconnected: onDisconnected ?? _defaultCallback,
      onDeviceDisconnecting: onDisconnecting ?? _defaultCallback,
      onDfuAborted: onAborted ?? _defaultCallback,
      onDfuProcessStarted: onProcessStarted ?? _defaultCallback,
      onDfuProcessStarting: (address) {
        countdownTimer.cancel();

        if (onProcessStarting != null) {
          onProcessStarting.call(address);
        } else {
          _defaultCallback(address);
        }
      },
      onError: _errorCallback,
    );
  }

  void _defaultCallback(String deviceAddress) =>
      _logger.info('Address: $deviceAddress');

  void _errorCallback(
    String address,
    int error,
    int errorType,
    String message,
  ) {
    _logger.warning(
      'Address $address, error: $error, '
      'errorType: $errorType, message: $message',
    );
  }
}
