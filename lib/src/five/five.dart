import '../day.dart';

class Five extends Day<List<Seat>, List<Seat>> {
  @override
  List<Seat> deserializeOneArgs(String args) {
    return args.split('\n').map((e) => Seat(e)).toList();
  }

  @override
  int one(args) {
    args.sort((seat1, seat2) {
      return seat1.id > seat2.id ? 1 : 0;
    });

    return args.last.id;
  }

  @override
  List<Seat> deserializeTwoArgs(String args) {
    return args.split('\n').map((e) => Seat(e)).toList();
  }

  @override
  int two(args) {
    var ids = args.map((e) => e.id).toList();
    ids.sort();

    return ids.fold<List<int>>([null, -1], (previousValue, element) {
      if (previousValue[1] != element - 1) {
        return [element - 1, element];
      } else {
        return [previousValue[0], element];
      }
    })[0];
  }
}

class Seat {
  final int row;
  final int column;
  int id;
  static final int _lastRow = 127;
  static final int _lastColumn = 7;

  static final Map<String, Seat> _seats = {};

  factory Seat(String locator) {
    var locators = _deserializeLocator(locator);
    _seats.putIfAbsent(
        locator, () => Seat._fromLocator(locators[0], locators[1]));
    return _seats[locator];
  }

  Seat._fromLocator(String rowLocator, String columnLocator)
      : row = _findRow(rowLocator),
        column = _findColumn(columnLocator) {
    id = row * 8 + column;
  }

  static int _findRow(String rowLocator) {
    return binarySearchInRange(
      rowLocator,
      max: _lastRow,
      frontHalfIndicator: 'F',
      backHalfIndicator: 'B',
    );
  }

  static int _findColumn(String columnLocator) {
    return binarySearchInRange(
      columnLocator,
      max: _lastColumn,
      frontHalfIndicator: 'L',
      backHalfIndicator: 'R',
    );
  }

  static List<String> _deserializeLocator(String locator) {
    return [locator.substring(0, 7), locator.substring(7)];
  }
}

int binarySearchInRange(
  String locator, {
  String frontHalfIndicator,
  String backHalfIndicator,
  int max,
  int min = 0,
}) {
  var currentMax = max;
  var currentMin = min;
  var directions = locator.split('');
  directions.forEach((element) {
    if (element == frontHalfIndicator) {
      currentMax = (currentMax - ((currentMax - currentMin) / 2)).floor();
    } else {
      currentMin = (((currentMax - currentMin) / 2) + currentMin).floor();
    }
  });

  return currentMax;
}
