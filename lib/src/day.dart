abstract class Day<T1, T2> {
  static void validate(int part) {
    if (part != 1 && part != 2) {
      throw 'A day only has two parts';
    }
  }

  dynamic run(int part, dynamic args) {
    if (part == 1) {
      var deserializedArgs = deserializeOneArgs(args);
      return one(deserializedArgs);
    } else {
      var deserializedArgs = deserializeTwoArgs(args);
      return two(deserializedArgs);
    }
  }

  dynamic one(T1 args);
  T1 deserializeOneArgs(String args);
  dynamic two(T2 args);
  T2 deserializeTwoArgs(String args);
}
