import 'package:aoc2020/utils/math.dart';

typedef FoldCallback<T, K> = K Function(K aggregator, T value);

FoldCallback<T, int> doIntMath<T>(
  IntMath operation,
  int Function(T arg) accessor,
) {
  int calculate(int aggregator, T value) {
    if (operation == IntMath.add) {
      return Math.add(aggregator, accessor(value));
    }

    if (operation == IntMath.subtract) {
      return Math.subtract(aggregator, accessor(value));
    }

    if (operation == IntMath.multiply) {
      return Math.multiply(aggregator, accessor(value));
    }

    if (operation == IntMath.floorDivide) {
      return Math.floorDivide(aggregator, accessor(value));
    }

    throw 'Function \'doMath\' requires one of \'add\', \'subtract\', \'multiply\', or \'floorDivide\'.';
  }

  return calculate;
}
