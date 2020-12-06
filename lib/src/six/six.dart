import '../day.dart';

class Six extends Day<List<Group>, List<Group>> {
  @override
  List<Group> deserializeOneArgs(String args) {
    var groupResponses = args.split('\n\n');
    return groupResponses.map((e) => Group(e)).toList();
  }

  @override
  int one(args) {
    return args.fold(0, (count, group) {
      return count + group.uniqueAnswers.length;
    });
  }

  @override
  List<Group> deserializeTwoArgs(String args) {
    var groupResponses = args.split('\n\n');
    return groupResponses.map((e) => Group(e)).toList();
  }

  @override
  int two(args) {
    return args.fold(0, (count, group) {
      return count + group.groupAnswers.length;
    });
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
    return members.fold(Set(), (answers, person) {
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
