import 'package:aoc2020/main.dart';

void main(List<String> arg) {
  var day = int.parse(arg[0], radix: 10);
  var part = int.parse(arg[1], radix: 10);
  Days().run(day, part).then((value) => print(value));
}
