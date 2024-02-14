part of 'domain.dart';

/// Represents a Bluetooth GUID.
/// A Bluetooth GUID (Globally Unique Identifier) is a 128-bit number
/// that is used to uniquely identify services and characteristics in Bluetooth.
class UnlockdGuid extends Equatable {
  /// Creates a GUID from a string.
  UnlockdGuid(String input) : bytes = _fromString(input);

  /// Creates a '00000000-0000-0000-0000-000000000000' GUID.
  UnlockdGuid.empty() : bytes = List.filled(16, 0);

  /// Creates a GUID from a list of bytes.
  /// GUID must be 16, 32, or 128 bit.
  UnlockdGuid.fromBytes(this.bytes)
      : assert(_checkLen(bytes.length), 'GUID must be 16, 32, or 128 bit.');

  /// Creates a GUID from a string.
  UnlockdGuid.fromString(String input) : bytes = _fromString(input);

  /// Bytes representation of the GUID.
  final List<int> bytes;

  static List<int> _fromString(String input) {
    if (input.isEmpty) {
      return List.filled(16, 0);
    }
    final sanitizedInput = input.replaceAll('-', '');
    final bytes = _tryHexDecode(sanitizedInput);

    if (bytes == null) {
      throw FormatException('GUID not hex format: $sanitizedInput');
    }

    _checkLen(bytes.length);

    return bytes;
  }

  static bool _checkLen(int len) {
    if (!(len == 16 || len == 4 || len == 2)) {
      throw FormatException(
        'GUID must be 16, 32, or 128 bit, yours: ${len * 8}-bit',
      );
    }
    return true;
  }

  /// 128-bit representation
  String get str128 {
    if (bytes.length == 2) {
      // 16-bit uuid
      return '0000${_hexEncode(bytes)}-0000-1000-8000-00805f9b34fb'
          .toLowerCase();
    }
    if (bytes.length == 4) {
      // 32-bit uuid
      return '${_hexEncode(bytes)}-0000-1000-8000-00805f9b34fb'.toLowerCase();
    }
    // 128-bit uuid
    final one = _hexEncode(bytes.sublist(0, 4));
    final two = _hexEncode(bytes.sublist(4, 6));
    final three = _hexEncode(bytes.sublist(6, 8));
    final four = _hexEncode(bytes.sublist(8, 10));
    final five = _hexEncode(bytes.sublist(10, 16));
    return '$one-$two-$three-$four-$five'.toLowerCase();
  }

  /// Shortest possible representation
  String get str {
    final starts = str128.startsWith('0000');
    final ends = str128.contains('-0000-1000-8000-00805f9b34fb');
    if (starts && ends) {
      // 16-bit
      return str128.substring(4, 8);
    }
    if (ends) {
      // 32-bit
      return str128.substring(0, 8);
    }
    // 128-bit
    return str128;
  }

  @override
  String toString() => str;

  @override
  List<Object> get props => [str128.hashCode];
}

String _hexEncode(List<int> numbers) {
  return numbers
      .map((n) => (n & 0xFF).toRadixString(16).padLeft(2, '0'))
      .join();
}

List<int>? _tryHexDecode(String hex) {
  final numbers = <int>[];
  for (var i = 0; i < hex.length; i += 2) {
    final hexPart = hex.substring(i, i + 2);
    final num = int.tryParse(hexPart, radix: 16);
    if (num == null) {
      return null;
    }
    numbers.add(num);
  }
  return numbers;
}
