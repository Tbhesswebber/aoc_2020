import 'package:aoc2020/main.dart';

void main(List<String> arg) {
  var day = int.parse(arg[0], radix: 10);
  try {
    var part = int.parse(arg[1], radix: 10);
    Days().run(day, part).then((value) => print(value));
  } on RangeError {
    Days()
        .run(day, 1)
        .then((value) => print('Part 1: $value'))
        .catchError((e) => print(e));
    Days()
        .run(day, 2)
        .then((value) => print('Part 2: $value'))
        .catchError((e) => print(e));
  }
}
