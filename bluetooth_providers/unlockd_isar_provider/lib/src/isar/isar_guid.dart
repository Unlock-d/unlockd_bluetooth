part of 'isar.dart';

/// A class representing a GUID in Isar.
@Embedded(inheritance: false)
class IsarGuid extends UnlockdGuid {
  /// Creates a GUID from a list of bytes.
  IsarGuid() : super.empty();

  /// Creates a GUID from a String.
  IsarGuid.fromString(super.input);

  /// The GUID as a String which is stored in Isar.
  ///
  /// We use this String to filter different characteristics/services in Isar
  /// queries since it's not possible to easily filter results by matching
  /// an entire list.
  String get isarGuid => str128;

  set isarGuid(String guid) => bytes = UnlockdGuid.fromString(guid).bytes;

  @ignore
  @override
  List<int> get bytes;

  set bytes(List<int> bytes) => this.bytes..replaceRange(0, 16, bytes);
}
