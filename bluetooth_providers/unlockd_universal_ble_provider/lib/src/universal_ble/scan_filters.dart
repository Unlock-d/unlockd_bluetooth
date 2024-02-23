part of 'universal_ble.dart';

/// A filter for scan results
class ScanFilters {
  /// Create a new [ScanFilters] instance
  ScanFilters({
    this.withServices,
    this.withRemoteIds,
    this.withNames,
    this.withKeywords,
    this.withMsd,
  })  : assert(withServices == null, 'withServices is not supported yet'),
        assert(withMsd == null, 'withMsd is not supported yet');

  /// Filter by advertised services
  final List<UnlockdGuid>? withServices;

  /// Filter for known remoteIds
  final List<String>? withRemoteIds;

  /// Filter by advertised names (exact match)
  final List<String>? withNames;

  /// Filter by advertised names (matches any substring)
  final List<String>? withKeywords;

  /// Filter by manufacture specific data
  final List<UnlockdMsdFilter>? withMsd;

  /// Returns true if the scan result matches any of the filters
  bool filter(UnlockdScanResult scanResult) {
    return _hasName(scanResult) ||
        _hasId(scanResult) ||
        _containsKeyword(scanResult);
  }

  bool _hasName(UnlockdScanResult scanResult) {
    return withNames?.any((name) => scanResult.device.advName == name) ?? true;
  }

  bool _hasId(UnlockdScanResult scanResult) {
    return withRemoteIds?.any((id) => scanResult.device.remoteId == id) ?? true;
  }

  bool _containsKeyword(UnlockdScanResult scanResult) {
    return withKeywords?.any(
          (keyword) => scanResult.device.advName
              .toLowerCase()
              .contains(keyword.toLowerCase()),
        ) ??
        true;
  }
}
