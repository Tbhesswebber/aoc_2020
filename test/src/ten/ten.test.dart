import 'dart:math';

import 'package:aoc2020/src/ten/ten.dart';
import 'package:test/test.dart';

import '../seven/seven.test.dart';

var input = '''16
10
15
5
1
11
7
19
6
12
4''';

var input2 = '''28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3''';

void main() {
  test('should run with test code', () {
    var ten = Ten();
    var args = ten.deserializeTwoArgs(input);
    expect(ten.two(args), 8);
  });

  test('should run with test code', () {
    var ten = Ten();
    var args = ten.deserializeTwoArgs(input2);
    expect(ten.two(args), 19208);
  });
}
