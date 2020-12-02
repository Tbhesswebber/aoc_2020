import '../day.dart';

class One extends Day<List<int>, dynamic> {
  @override
  dynamic one(List<int> args) {
    int value;
    args.forEach((e) => {
          args.forEach((f) => {
                if (e + f == 2020) {value = e * f}
              })
        });
    return value;
  }

  @override
  List<int> deserializeOneArgs(String args) {
    var list = args.split('\n');
    return list.map((e) => int.parse(e, radix: 10)).toList();
  }

  @override
  dynamic two(args) {
    int value;
    args.forEach((e) => {
          args.forEach((f) => {
                args.forEach((g) => {
                      if (e + f + g == 2020) {value = e * f * g}
                    })
              })
        });
    return value;
  }

  @override
  List<int> deserializeTwoArgs(String args) {
    return deserializeOneArgs(args);
  }
}
