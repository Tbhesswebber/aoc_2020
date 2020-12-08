import 'package:aoc2020/src/eight/eight.dart';
import 'package:test/test.dart';

var input = '''nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6''';
void main() {
  test('should work on inputs', () {
    var ins = Instructions(input.split('\n'));
    expect(ins.swapRun(), 8);
  });
}
