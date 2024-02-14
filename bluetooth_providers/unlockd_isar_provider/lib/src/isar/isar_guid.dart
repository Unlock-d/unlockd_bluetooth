part of 'isar.dart';

/// A class representing a GUID in Isar.
@Embedded(inheritance: false)
class IsarGuid extends UnlockdGuid {
  /// Creates a GUID from a list of bytes.
  IsarGuid() : super.empty();

  /// Creates a GUID from a String.
  IsarGuid.fromString(super.input);

  /// Bytes representation of the GUID.
  @override
  List<int> get bytes;

  set bytes(List<int> bytes) => this.bytes..replaceRange(0, 16, bytes);
}
