import 'package:aoc2020/src/five/five.dart';
import 'package:aoc2020/src/four/four.dart';
import 'package:aoc2020/src/three/three.dart';
import 'dart:io';
import 'package:aoc2020/src/day.dart';
import 'package:aoc2020/src/one/one.dart';
import 'package:aoc2020/src/two/two.dart';

class Days {
  final Map<int, Day> _days = {};

  Days() {
    register(5, Five());
    register(4, Four());
    register(3, Three());
    register(2, Two());
    register(1, One());
  }

  Future<dynamic> run(int dayNumber, int part) async {
    Day.validate(part);
    var inputPath = Directory.current.path + '/lib/inputs/$dayNumber-$part.txt';
    var input = await File(inputPath).readAsString();
    if (part == 2 && input.isEmpty) {
      inputPath = Directory.current.path + '/lib/inputs/$dayNumber-1.txt';
      input = await File(inputPath).readAsString();
    }
    return _days[dayNumber].run(part, input);
  }

  void register(int dayNum, Day day) {
    _days.putIfAbsent(dayNum, () => day);
  }
}

// TODO: Export any libraries intended for clients of this package.