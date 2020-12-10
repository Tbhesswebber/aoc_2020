import 'package:aoc2020/data_structures/tree.dart';
import 'package:aoc2020/utils/args.dart';

import '../day.dart';

class Ten extends Day<List<int>, List<int>> {
  @override
  List<int> deserializeOneArgs(String args) {
    return splitOnLineAndConvert(args, to: (e) => int.parse(e));
  }

  @override
  int one(args) {
    args.sort();
    var nums = args.fold(
        <int>[0, 1, 0],
        (pre, e) => pre[2] == e - 1
            ? [pre[0] + 1, pre[1], e]
            : pre[2] == e - 3
                ? [pre[0], pre[1] + 1, e]
                : [pre[0], pre[1], e]);
    return nums[0] * nums[1];
  }

  @override
  List<int> deserializeTwoArgs(String args) {
    return splitOnLineAndConvert(args, to: (e) => int.parse(e));
  }

  @override
  int two(args) {
    args.sort();
    args.insert(0, 0);
    var deviceJoltage = args.last + 3;
    args.insert(args.length, deviceJoltage);
    var nums = JoltTree.fromList(args);

    bool isWithinThreeAndHasChilren(TreeNode<int> n) {
      return deviceJoltage - 3 <= n.value && n.children.isEmpty;
    }

    return nums.countLeafsWhere(nums.root, isWithinThreeAndHasChilren);
  }
}

class JoltTree extends Tree<int> {
  int _size = 0;

  JoltTree.fromList(List<int> args) : super(UniqueTreeNode(args[0])) {
    var queue = <UniqueTreeNode<int>>[];
    for (var arg in args) {
      var node = UniqueTreeNode(arg);
      _size += 1;
      while (queue.isNotEmpty && queue.first.value < arg - 3) {
        queue.removeAt(0);
      }
      for (var queued in queue) {
        queued.children.add(node);
      }
      queue.add(node);
    }
  }

  int get size {
    return _size;
  }
}
