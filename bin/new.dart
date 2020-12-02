import 'dart:io';

void main(List<String> args) {
  // throws if the first argument isn't a number
  var day = int.parse(args[0]);
  var dayStr = numbers[day];
  var DayStr = dayStr.splitMapJoin(RegExp(r'^\w'),
      onMatch: (m) => '${m.group(0).toUpperCase()}');

  var libPath = Directory.current.path + '/lib';
  var inputPath = libPath + '/inputs';

  File(inputPath + '/$day-1.json').createSync();
  File(inputPath + '/$day-2.json').createSync();

  var problemPath = libPath + '/src';
  var solutionDirPath = problemPath + '/$dayStr';
  var solutionPath = solutionDirPath + '/${dayStr}.dart';
  var testDirPath = Directory.current.path + '/test' + '/src/$dayStr';
  var testPath = testDirPath + '/${dayStr}.test.dart';
  ;
  Directory(testDirPath).createSync();
  File(testPath).createSync();
  Directory(solutionDirPath).createSync();
  File(solutionPath).create().then((file) {
    file.writeAsString([
      'import \'../day.dart\';',
      '',
      'class $DayStr extends Day<List<OneArg>, List<TwoArg>> {',
      '',
      '  @override',
      '  List<OneArg> deserializeOneArgs(String args) {',
      '    // TODO: implement deserializeOneArgs',
      '    throw UnimplementedError();',
      '}',
      '',
      '  @override',
      '  one(args) {',
      '    // TODO: implement one',
      '    throw UnimplementedError();',
      '  }',
      '',
      '  @override',
      '  List<TwoArg> deserializeTwoArgs(String args) {',
      '    // TODO: implement deserializeTwoArgs',
      '    throw UnimplementedError();',
      '}',
      '',
      '  @override',
      '  two(args) {',
      '    // TODO: implement one',
      '    throw UnimplementedError();',
      '  }',
      '',
      '}',
      '',
      'class OneArg {}',
      '',
      'class TwoArg {}'
    ].join('\n'));
  });

  var mainFile = File(libPath + '/main.dart');
  var contents = mainFile.readAsLinesSync();
  var constructorIndex = contents.indexOf('  Days() {');
  contents.insert(constructorIndex + 1, '    register($day, $DayStr());');
  contents.insert(0, 'import \'package:aoc2020/src/$dayStr/$dayStr.dart\';');
  mainFile.writeAsStringSync(contents.join('\n'));
}

const Map<int, String> numbers = {
  1: 'one',
  2: 'two',
  3: 'three',
  4: 'four',
  5: 'five',
  6: 'six',
  7: 'seven',
  8: 'eight',
  9: 'nine',
  10: 'ten',
  11: 'eleven',
  12: 'twelve',
  13: 'thirteen',
  14: 'fourteen',
  15: 'fifteen',
  16: 'sixteen',
  17: 'seventeen',
  18: 'eighteen',
  19: 'nineteen',
  20: 'twenty',
  21: 'twenty-one',
  22: 'twenty-two',
  23: 'twenty-three',
  24: 'twenty-four',
  25: 'twenty-five'
};
