part of 'domain.dart';

/// Filter for manufacturer specific data
class UnlockdMsdFilter {
  /// Create a new filter
  /// The 'mask' must have the same length as 'data'.
  UnlockdMsdFilter(
    this.manufacturerId, {
    this.data = const [],
    this.mask = const [],
  }) : assert(
          data.length == mask.length,
          'data and mask must have the same length',
        );

  /// The manufacturer id
  int manufacturerId;

  /// filter for this data
  List<int> data;

  /// For any bit in the mask, set it the 1 if it needs to match
  /// the one in manufacturer data, otherwise set it to 0.
  /// The 'mask' must have the same length as 'data'.
  List<int> mask;
}
