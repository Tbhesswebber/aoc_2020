import 'package:aoc2020/src/seven/seven.dart';
import 'package:aoc2020/utils/args.dart';
import 'package:test/test.dart';

var input = '''
light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
''';

var input2 = '''
shiny gold bags contain 2 dark red bags.
dark red bags contain 2 dark orange bags.
dark orange bags contain 2 dark yellow bags.
dark yellow bags contain 2 dark green bags.
dark green bags contain 2 dark blue bags.
dark blue bags contain 2 dark violet bags.
dark violet bags contain no other bags.
''';

void main() {
  test('1 should work with the sample', () {
    var rules = splitOnLineAndConvert(input, to: (arg) => Rule.raw(arg));
    expect(rules.any((element) => element.shinyGold), true);
  });

  test('2 should work with the sample', () {
    var rules = splitOnLineAndConvert(input2, to: (arg) => Rule.raw(arg));
    expect(Rule('shiny gold').nestedBags, 126);
  });
}
