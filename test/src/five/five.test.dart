import 'package:aoc2020/src/five/five.dart';
import 'package:test/test.dart';

void main() {
  test('should get first value for all front halves', () {
    var result = binarySearchInRange('AAAA',
        max: 16, frontHalfIndicator: 'A', backHalfIndicator: 'B');
    expect(result, 1);
  }, skip: false);

  test('should get last value for all front halves', () {
    var result = binarySearchInRange('BBBB',
        max: 16, frontHalfIndicator: 'A', backHalfIndicator: 'B');
    expect(result, 16);
  }, skip: false);

  test('should get front of the back half value for back front...', () {
    var result = binarySearchInRange('BAAA',
        max: 16, frontHalfIndicator: 'A', backHalfIndicator: 'B');
    expect(result, 9);
  });

  test('should pass first sample', () {
    var row = binarySearchInRange('BFFFBBF',
        max: 127, frontHalfIndicator: 'F', backHalfIndicator: 'B');
    expect(row, 70);
    var column = binarySearchInRange('RRR',
        max: 7, frontHalfIndicator: 'L', backHalfIndicator: 'R');
    expect(column, 7);
  });

  test('should pass second sample', () {
    var row = binarySearchInRange('FFFBBBF',
        max: 127, frontHalfIndicator: 'F', backHalfIndicator: 'B');
    expect(row, 14);
    var column = binarySearchInRange('RRR',
        max: 7, frontHalfIndicator: 'L', backHalfIndicator: 'R');
    expect(column, 7);
  });

  test('should pass third sample', () {
    var row = binarySearchInRange('BBFFBBF',
        max: 127, frontHalfIndicator: 'F', backHalfIndicator: 'B');
    expect(row, 102);
    var column = binarySearchInRange('RLL',
        max: 7, frontHalfIndicator: 'L', backHalfIndicator: 'R');
    expect(column, 4);
  });
}
