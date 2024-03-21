import 'dart:async';

import 'package:unlockd_bluetooth_core/src/domain/domain.dart';

/// Abstract class that defines the methods that
/// a [UnlockdBluetoothAdapter] must implement.
abstract class UnlockdBluetoothAdapter {
  /// The current UnlockdBluetoothProvider version.
  static const String version = '0.0.0-placeholder';

  /// The default UnlockdBluetoothProvider instance name.
  static const String defaultName = 'default';

  /// The name of the [UnlockdBluetoothAdapter].
  String get name;

  /// Method to cleanup the resources used by the [UnlockdBluetoothAdapter].
  Future<void> close();

  UnlockdBluetoothDevice fromRemoteId(String remoteId);

  Future<void> turnOn();

  Future<void> turnOff();

  Stream<UnlockdBluetoothAdapterState> adapterState();

  bool get isScanningNow;

  Stream<bool> isScanning();

  /// Start a scan, and return a stream of results
  /// Note: scan filters use an "or" behavior. i.e. if you set
  /// `withServices` & `withNames` we return all the advertisements that match
  /// any of the specified services *or* any of the specified names.
  ///   - [withServices] filter by advertised services
  ///   - [withRemoteIds] filter for known remoteIds
  ///   (iOS: 128-bit guid, android: 48-bit mac address)
  ///   - [withNames] filter by advertised names (exact match)
  ///   - [withKeywords] filter by advertised names (matches any substring)
  ///   - [withMsd] filter by manufacture specific data
  ///   - [timeout] calls stopScan after a specified duration
  ///   - [androidUsesFineLocation] request `ACCESS_FINE_LOCATION`
  ///   permission at runtime
  Future<void> startScan({
    Duration? timeout,
    bool? androidUsesFineLocation,
    List<UnlockdGuid>? withServices,
    List<String>? withRemoteIds,
    List<String>? withNames,
    List<String>? withKeywords,
    List<UnlockdMsdFilter>? withMsd,
  });

  Future<void> stopScan();

  Future<List<UnlockdBluetoothDevice>> get systemDevices;

  /// a stream of scan results
  /// - if you re-listen to the stream it re-emits the previous results
  /// - the list contains all the results since the scan started
  Stream<List<UnlockdScanResult>> scanResults();

  /// This is the same as scanResults, except:
  /// - it *does not* re-emit previous results after scanning stops.
  Stream<List<UnlockdScanResult>> onScanResults();

  void cancelWhenScanComplete<T>(StreamSubscription<T> subscription);
}
