part of 'fakes.dart';

/// A [Fake] implementation of [UnlockdScanResult].
class FakeScanResult extends Fake implements UnlockdScanResult {
  /// Creates a [FakeScanResult] with the given parameters.
  FakeScanResult({
    required this.device,
    required this.rssi,
    required this.advertisementData,
  });

  @override
  final UnlockdBluetoothDevice device;

  @override
  final int rssi;

  @override
  final UnlockdAdvertisementData advertisementData;
}
