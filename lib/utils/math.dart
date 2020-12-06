abstract class Math {
  static int add(int a, int b) {
    return a + b;
  }

  static int subtract(int a, int b) {
    return a - b;
  }

  static int multiply(int a, int b) {
    return a * b;
  }

  static double divide(int a, int b) {
    return a / b;
  }

  static int floorDivide(int a, int b) {
    return (a / b).floor();
  }

  static T arraySum<T extends num, K>(List<K> numbers,
      {T Function(K) transform, addTo = 0}) {
    return numbers.isEmpty
        ? addTo
        : arraySum(
            numbers.sublist(1),
            transform: transform,
            addTo: addTo +
                (transform != null ? transform(numbers[0]) : numbers[0]),
          );
    // return numbers.fold(0, (sum, val) {
    //   if (transform != null) {
    //     return sum + transform(val);
    //   }

    //   return sum + val;
    // });
  }
}

enum IntMath {
  add,
  subtract,
  multiply,
  floorDivide,
}
