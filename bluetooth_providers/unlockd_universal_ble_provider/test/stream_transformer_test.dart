import 'package:flutter_test/flutter_test.dart';
import 'package:stream_transform/stream_transform.dart';

void main() {
  Stream<int> wickedFastStream() async* {
    for (final counter in List.generate(10, (index) => index)) {
      // Every 4th event takes longer to emit.
      if (counter % 4 == 0) {
        await Future<void>.delayed(const Duration(milliseconds: 150));
      } else {
        await Future<void>.delayed(const Duration(milliseconds: 90));
      }

      yield counter;
    }
  }

  test('We can handle wicked fast streams', () {
    expectLater(
      wickedFastStream().debounceBuffer(const Duration(milliseconds: 100)),
      emitsInOrder([
        [0, 1, 2, 3],
        [4, 5, 6, 7],
        [8, 9],
        emitsDone,
      ]),
    );
  });

  test('Even async predicates fall at our feet', () {
    expectLater(
      wickedFastStream().asyncWhere((event) async {
        await Future<void>.delayed(const Duration(milliseconds: 10));
        return event.isEven;
      }),
      emitsInOrder([
        0,
        2,
        4,
        6,
        8,
        emitsDone,
      ]),
    );
  });
}
