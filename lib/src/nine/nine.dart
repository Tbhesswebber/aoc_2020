import 'dart:math';

import 'package:aoc2020/utils/args.dart';
import 'package:aoc2020/utils/math.dart';

import '../day.dart';

class Nine extends Day<List<int>, List<int>> {
  @override
  List<int> deserializeOneArgs(String args) {
    return splitOnLineAndConvert(args, to: (e) => int.parse(e));
  }

  @override
  int one(args, [preAmbleLength = 25]) {
    var currentIndex = preAmbleLength;
    var preambleStart = 0;

    while (true) {
      var current = args[currentIndex];
      var hasMatch = false;
      for (var i = preambleStart; i < currentIndex; i += 1) {
        for (var j = preambleStart + 1; j < currentIndex; j += 1) {
          if (args[i] + args[j] == current) {
            hasMatch = true;
          }
        }
        if (hasMatch) {
          break;
        }
      }

      if (!hasMatch) {
        return current;
      }

      currentIndex += 1;
      preambleStart += 1;
    }
  }

  @override
  List<int> deserializeTwoArgs(String args) {
    return splitOnLineAndConvert(args, to: (e) => int.parse(e));
  }

  @override
  int two(args, [preambleLength = 25]) {
    var watch = Stopwatch()..start();
    var value = one(args, preambleLength);
    print(watch.elapsed);
    for (var i = 0; i < args.length; i += 1) {
      if (args[i] >= value) {
        continue;
      }
      for (var j = i + 1; j < args.length; j += 1) {
        var sublist = args.sublist(i, j);
        var sum = Math.arraySum(sublist);
        if (sum > value) {
          break;
        }
        if (sum == value) {
          var max = sublist
              .reduce((value, element) => value > element ? value : element);
          var min = sublist
              .reduce((value, element) => value < element ? value : element);
          print(watch.elapsed);
          return max + min;
        }
      }
    }

    throw 'No value found';
  }
}
