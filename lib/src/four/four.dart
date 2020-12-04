import '../day.dart';

class Four extends Day<List<Passport>, List<Passport>> {
  @override
  List<Passport> deserializeOneArgs(String args) {
    var data = args.split('\n\n');
    return data.map((datum) => Passport.fromInput(datum)).toList();
  }

  @override
  int one(args) {
    var goodPassports = args.fold(
      0,
      (previousValue, element) =>
          previousValue + (element.isValidCid() ? 1 : 0),
    );

    return goodPassports;
  }

  @override
  List<Passport> deserializeTwoArgs(String args) {
    var data = args.split('\n\n');
    return data.map((datum) => Passport.fromInput(datum)).toList();
  }

  @override
  int two(args) {
    var goodPassports = args.fold(
      0,
      (previousValue, passport) => previousValue + (passport.isValid() ? 1 : 0),
    );

    return goodPassports;
  }
}

class Passport {
  final Map<String, String> _data = {
    'byr': null,
    'iyr': null,
    'eyr': null,
    'hgt': null,
    'hcl': null,
    'ecl': null,
    'pid': null,
    'cid': null,
  };
  int size = 0;

  Passport.fromInput(String data) {
    var lines = data.split('\n');
    var unified = lines.join(' ');
    var pairs = unified.split(' ');
    var kv = pairs.map((pair) => pair.split(':'));
    kv.forEach((element) {
      _data[element[0]] = element[1];
      size += 1;
    });
  }

  bool isValid() {
    return isValidCid() &&
        isValidByr() &&
        isValidPid() &&
        isValidEyr() &&
        isValidIyr() &&
        isValidHgt() &&
        isValidHcl() &&
        isValidEcl();
  }

  bool isValidCid() {
    return (size == 7 && _data['cid'] == null) || size == 8;
  }

  bool isValidEcl() {
    var colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'];
    var result = colors.contains(_data['ecl']);
    return result;
  }

  bool isValidHcl() {
    var result =
        RegExp(r'(^#[a-f0-9]{6}$)').allMatches(_data['hcl']).length == 1;
    return result;
  }

  bool isValidHgt() {
    var hgt = _data['hgt'];
    var unitMatch = RegExp(r'(in|cm)').allMatches(hgt);
    var numMatch = RegExp(r'(\d+)').allMatches(hgt);
    bool result;
    if (unitMatch.isEmpty || numMatch.isEmpty) return false;
    var unit = unitMatch.first.group(0);
    var num = numMatch.first.group(0);
    if (unit == 'cm') {
      result = 150 <= int.parse(num) && int.parse(num) <= 193;
    } else {
      result = 59 <= int.parse(num) && int.parse(num) <= 76;
    }

    return result;
  }

  bool isValidPid() {
    var matcher = RegExp(r'(^\d{9}$)');
    var result = matcher.allMatches(_data['pid']).toList().length == 1 &&
        _data['pid'].length == 9;
    return result;
  }

  bool isValidEyr() {
    var result =
        2020 <= int.parse(_data['eyr']) && int.parse(_data['eyr']) <= 2030;
    return result;
  }

  bool isValidIyr() {
    var result =
        2010 <= int.parse(_data['iyr']) && int.parse(_data['iyr']) <= 2020;
    return result;
  }

  bool isValidByr() {
    var result =
        1920 <= int.parse(_data['byr']) && int.parse(_data['byr']) <= 2002;
    return result;
  }

  @override
  String toString() {
    return '[size: $size, ${_data.toString()}]';
  }
}
