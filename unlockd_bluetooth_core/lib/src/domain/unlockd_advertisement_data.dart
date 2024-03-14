part of 'domain.dart';

/// This class represents the advertisement data of a Bluetooth device.
abstract class UnlockdAdvertisementData {
  /// The device name.
  String get advName;

  /// Indicates what the expected signal level should be
  /// when you are one meter away.
  int? get txPowerLevel;

  /// Bool indicating if the device is connectable.
  bool get connectable;

  /// The manufacturer data, indexed by manufacturer ID.
  Map<int, List<int>> get manufacturerData;

  /// The service data, indexed by service UUID.
  Map<UnlockdGuid, List<int>> get serviceData;

  /// UUIDs of services advertised by the device.
  List<String> get serviceUuids;
}
