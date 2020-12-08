import 'package:aoc2020/utils/args.dart';
import 'package:meta/meta.dart';

import '../day.dart';

class Eight extends Day<Instructions, Instructions> {
  @override
  Instructions deserializeOneArgs(String args) {
    return Instructions(splitOnLineAndConvert(args, to: (e) => e));
  }

  @override
  int one(args) {
    var result;
    args.run(
      onLoop: (a) {
        result = a;
      },
      onResult: (a) {
        result = a;
      },
    );

    return result;
  }

  @override
  Instructions deserializeTwoArgs(String args) {
    return Instructions(splitOnLineAndConvert(args, to: (e) => e));
  }

  @override
  int two(args) {
    return args.swapRun();
  }
}

class Instruction {
  String instruction;
  final int amount;
  bool _run = false;

  Instruction(String line)
      : instruction = line.split(' ')[0],
        amount = int.parse(line.split(' ')[1]);

  bool get hasRun {
    if (!_run) {
      _run = true;
      return false;
    }

    return _run;
  }

  void reset() {
    _run = false;
  }

  @override
  String toString() {
    return 'Instruction($instruction | $amount)';
  }
}

class Instructions {
  final List<Instruction> instructions;

  Instructions(List<String> args)
      : instructions = args.map((e) => Instruction(e)).toList();

  void run({
    @required void Function(int result) onLoop,
    @required void Function(int result) onResult,
  }) {
    var i = 0;
    var a = 0;

    while (true) {
      var instruction = instructions[i];
      if (instruction.hasRun) {
        onLoop(a);
        break;
      }

      if (instruction.instruction == 'jmp') {
        i += instruction.amount;
      } else if (instruction.instruction == 'acc') {
        a += instruction.amount;
        i += 1;
      } else {
        i += 1;
      }

      if (i == instructions.length) {
        onResult(a);
        return;
      }
    }
  }

  int swapRun() {
    int result;
    for (var instruction in instructions) {
      if (instruction.instruction == 'jmp') {
        instruction.instruction = 'nop';
      } else if (instruction.instruction == 'nop') {
        instruction.instruction = 'jmp';
      } else {
        continue;
      }

      run(
        onLoop: (a) {
          result = null;
        },
        onResult: (a) {
          result = a;
        },
      );
      if (result != null) {
        return result;
      }

      if (instruction.instruction == 'jmp') {
        instruction.instruction = 'nop';
      } else if (instruction.instruction == 'nop') {
        instruction.instruction = 'jmp';
      }

      instructions.forEach((element) {
        element.reset();
      });
    }

    return result;
  }
}
