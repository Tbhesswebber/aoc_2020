import 'package:aoc2020/utils/args.dart';
import 'package:aoc2020/utils/math.dart';

import '../day.dart';

class Seven extends Day<List<Rule>, List<Rule>> {
  @override
  List<Rule> deserializeOneArgs(String args) {
    return splitOnLineAndConvert(args, to: (arg) => Rule.raw(arg));
  }

  @override
  int one(args) {
    return args.fold(0, (count, rule) {
      if (rule != null && rule.shinyGold) {
        return count += 1;
      }
      return count;
    });
  }

  @override
  List<Rule> deserializeTwoArgs(String args) {
    return splitOnLineAndConvert(args, to: (arg) => Rule.raw(arg));
  }

  @override
  int two(args) {
    return Rule('shiny gold').nestedBags;
  }
}

class Rule {
  static final Map<String, Rule> _rules = {};
  String color;
  final Map<String, int> contains;
  bool _doesContain;
  int _bagsIn;

  factory Rule.raw(String input) {
    var contains = <String, int>{};
    var rule = input
        .replaceAll(r' contain', ',')
        .replaceAll(RegExp('bags?'), '')
        .replaceAll(r'.', '')
        .trim();
    var parts = rule.split(', ');
    var color = parts[0].trim();

    parts.sublist(1).forEach((element) {
      if (element.trim() == 'no other') {
        return;
      }
      var color = RegExp(r'\s([\w\s]+)').firstMatch(element).group(0).trim();
      var number = int.parse(RegExp(r'(\d+)').firstMatch(element).group(0));

      contains.putIfAbsent(color, () => number);
    });
    _rules.putIfAbsent(color, () => Rule._internal(color.trim(), contains));
    if (contains.isNotEmpty) {
      _rules[color.trim()] = Rule._internal(color.trim(), contains);
    }

    return _rules[color];
  }

  factory Rule(String color) {
    return _rules[color];
  }

  Rule._internal(this.color, this.contains);

  bool get shinyGold {
    _doesContain ??= contains.keys.any((element) => element == 'shiny gold') ||
        contains.keys.any((element) {
          print(element);
          print(_rules[element]);
          return _rules[element].shinyGold;
        });

    return _doesContain;
  }

  int get nestedBags {
    _bagsIn = _bagsIn ??
        Math.arraySum(contains.entries
            .map((e) => (_rules[e.key].nestedBags + 1) * e.value)
            .toList());

    return _bagsIn;
  }
}
