import 'package:aoc2020/utils/args.dart';
import 'package:aoc2020/utils/math.dart';

import '../day.dart';

class Six extends Day<List<Group>, List<Group>> {
  @override
  List<Group> deserializeOneArgs(String args) {
    return splitOnDoubleBlankAndConvert(args, to: (e) => Group(e));
  }

  @override
  int one(args) {
    return Math.arraySum(
      args,
      transform: (group) => group.uniqueAnswers.length,
    );
  }

  @override
  List<Group> deserializeTwoArgs(String args) {
    return splitOnDoubleBlankAndConvert(args, to: (e) => Group(e));
  }

  @override
  int two(args) {
    return Math.arraySum(
      args,
      transform: (group) => group.groupAnswers.length,
    );
  }
}

class Group {
  final List<Person> members;

  Group(String responses)
      : members = splitOnBlankAndConvert(responses, to: (res) => Person(res));

  int get size {
    return members.length;
  }

  List<String> get groupAnswers {
    var allAnswered = <String>[];

    for (var answer in members[0].answers) {
      if (members.every((element) {
        return element.answers.contains(answer);
      })) {
        allAnswered.add(answer);
      }
    }

    return allAnswered;
  }

  Set<String> get uniqueAnswers {
    return members.fold(<String>{}, (answers, person) {
      person.answers.forEach((element) {
        answers.add(element);
      });

      return answers;
    });
  }
}

class Person {
  final List<String> answers;
  Person(String responses) : answers = responses.split('');
}
