import 'package:flutter_test/flutter_test.dart';
import 'package:unlockd_bluetooth_core/src/domain/domain.dart';

void main() {
  test('Can create a new $UnlockdGuid', () {
    var actual = UnlockdGuid.empty();
    expect(actual.bytes, _nullBytes(16));

    actual = UnlockdGuid.fromBytes(const [1, 2, 3, 4]);
    expect(actual.bytes, const [1, 2, 3, 4]);

    actual = UnlockdGuid.fromString('62a81c83-de7c-4f1d-8a20-bbbfcbc11c48');
    expect(actual.bytes, _uuidBytes);

    actual = UnlockdGuid('62a81c83-de7c-4f1d-8a20-bbbfcbc11c48');
    expect(actual.bytes, _uuidBytes);
  });

  test('toString should return a UUID value', () {
    final actual = UnlockdGuid.fromBytes(_uuidBytes);
    expect(actual.toString(), '62a81c83-de7c-4f1d-8a20-bbbfcbc11c48');
  });

  test('Should throw when creating a new $UnlockdGuid from invalid bytes', () {
    expect(
      () => UnlockdGuid.fromBytes(const [0]),
      throwsA(isA<FormatException>()),
    );
  });
}

List<int> _nullBytes(int length) => List<int>.filled(length, 0x00);

const _uuidBytes = [
  98,
  168,
  28,
  131,
  222,
  124,
  79,
  29,
  138,
  32,
  187,
  191,
  203,
  193,
  28,
  72,
];
