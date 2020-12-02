import '../day.dart';

class Two extends Day<List<OneArg>, List<TwoArg>> {
  @override
  List<OneArg> deserializeOneArgs(String args) {
    var list = args.split('\n');
    return list.map((e) => OneArg(e)).toList();
  }

  @override
  int one(args) {
    return args.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.isValid() ? 1 : 0));
  }

  @override
  List<TwoArg> deserializeTwoArgs(String args) {
    var list = args.split('\n');
    return list.map((e) => TwoArg(e)).toList();
  }

  @override
  int two(args) {
    return args.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.isValid() ? 1 : 0));
  }
}

class OneArg {
  int min;
  int max;
  String char;
  String password;

  OneArg(String arg) {
    var subsets = arg.split(' ');
    min = int.parse(subsets[0].split('-')[0]);
    max = int.parse(subsets[0].split('-')[1]);
    char = subsets[1][0];
    password = subsets[2];
  }

  bool isValid() {
    var count = charCount();
    return min <= count && count <= max;
  }

  int charCount() {
    return password.split('').fold<int>(0,
        (previousValue, element) => previousValue + (element == char ? 1 : 0));
  }
}

class TwoArg {
  int first;
  int second;
  String char;
  String password;

  TwoArg(String arg) {
    var subsets = arg.split(' ');
    first = int.parse(subsets[0].split('-')[0]) - 1;
    second = int.parse(subsets[0].split('-')[1]) - 1;
    char = subsets[1][0];
    password = subsets[2];
  }

  bool isValid() {
    return password[first] == char && password[second] != char ||
        password[first] != char && password[second] == char;
  }
}
