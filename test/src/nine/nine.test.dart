import 'package:aoc2020/src/nine/nine.dart';
import 'package:test/test.dart';

var input = '''35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576''';

void main() {
  test('should work with input', () {
    expect(Nine().two(Nine().deserializeTwoArgs(input), 5), 62);
  });
}
