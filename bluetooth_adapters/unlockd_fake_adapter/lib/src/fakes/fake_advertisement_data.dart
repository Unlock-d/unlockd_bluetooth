part of 'fakes.dart';

/// A [Fake] implementation of [UnlockdAdvertisementData].
class FakeAdvertisementData extends Fake implements UnlockdAdvertisementData {
  /// Create a [FakeAdvertisementData] with the given parameters.
  FakeAdvertisementData({
    required this.advName,
    required this.txPowerLevel,
    required this.connectable,
    required this.manufacturerData,
    required this.serviceData,
    required this.serviceUuids,
  });

  @override
  final String advName;

  @override
  final int? txPowerLevel;

  @override
  final bool connectable;

  @override
  final Map<int, List<int>> manufacturerData;

  @override
  final Map<UnlockdGuid, List<int>> serviceData;

  @override
  final List<String> serviceUuids;
}
