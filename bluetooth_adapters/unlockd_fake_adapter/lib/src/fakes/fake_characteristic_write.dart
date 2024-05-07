part of 'fakes.dart';

/// A wrapper class which encapsulates all data linked to the writing of data
/// to a characteristic.
class FakeCharacteristicWrite extends Equatable {
  /// Creates a [FakeCharacteristicWrite].
  const FakeCharacteristicWrite({
    required this.serviceGuid,
    required this.characteristicGuid,
    required this.value,
  });

  /// The service GUID.
  final UnlockdGuid serviceGuid;

  /// The characteristic GUID.
  final UnlockdGuid characteristicGuid;

  /// The value to write.
  final Uint8List value;

  @override
  List<Object?> get props => [serviceGuid, characteristicGuid, value];
}
