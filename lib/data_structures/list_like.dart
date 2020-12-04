class ListLike<T> {
  final List<T> values;

  ListLike(dynamic values) : values = values;

  T operator [](int index) {
    return values[index];
  }

  int get length {
    return values.length;
  }

  @override
  String toString() {
    return values.toString();
  }
}
