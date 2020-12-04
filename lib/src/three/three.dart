import '../day.dart';

class Three extends Day<Mountain, Mountain> {
  @override
  Mountain deserializeOneArgs(String args) {
    return Mountain(args.split('\n'));
  }

  @override
  int one(mountain) {
    var slope = Slope(x: 3);
    return mountain.countTrees(slope);
  }

  @override
  Mountain deserializeTwoArgs(String args) {
    return Mountain(args.split('\n'));
  }

  @override
  int two(args) {
    var slopes = [
      Slope(x: 1),
      Slope(x: 3),
      Slope(x: 5),
      Slope(x: 7),
      Slope(x: 1, y: 2),
    ];

    return slopes.fold(1, (previousValue, slope) {
      return previousValue * args.countTrees(slope);
    });
  }
}

class ListLike<T> {
  final List<T> _values;

  ListLike(dynamic values) : _values = values;

  T operator [](int index) {
    return _values[index];
  }

  int get length {
    return _values.length;
  }
}

class Mountain extends ListLike<Elevation> {
  Mountain(List<String> rows) : super(rows.map((e) => Elevation(e)).toList());

  bool isTree(x, y) {
    return super._values[y].isTree(x);
  }

  int countTrees(Slope slope) {
    var trees = 0;
    slope.traverse(this, (arg, x, y) {
      if (arg.isTree(x)) {
        trees += 1;
      }
    });

    return trees;
  }
}

class Elevation extends ListLike<String> {
  Elevation(String values) : super(values.split(''));

  bool isTree(x) {
    return super._values[x] == '#';
  }
}

class Slope {
  final int x;
  final int y;

  Slope({this.x, this.y = 1});

  void traverse(
    Mountain mountain,
    void Function(Elevation arg, int x, int y) callback,
  ) {
    var _currentX = 0;
    var _currentY = 0;
    var height = mountain.length;
    var width = mountain[0].length;
    while (_currentY < mountain.length) {
      callback(mountain[_currentY], _currentX, _currentY);
      _currentX += x;
      _currentY += y;
      if (_currentY < height && _currentX >= width) {
        _currentX -= mountain[_currentY].length;
      }
    }
  }
}
