class TreeNode<T> {
  final T value;
  final List<TreeNode<T>> children = [];

  TreeNode(this.value);

  @override
  String toString() {
    return 'TreeNode[$value, [${children.length}]]';
  }
}

class UniqueTreeNode<T> extends TreeNode<T> {
  static final _uniqueNodes = {};
  factory UniqueTreeNode(T value) {
    return _uniqueNodes.putIfAbsent(
        value, () => UniqueTreeNode._internal(value));
  }

  UniqueTreeNode._internal(T value) : super(value);
}

class Tree<T> {
  final TreeNode<T> root;

  Tree(TreeNode<T> root) : root = root;

  int countLeafsWhere(
    TreeNode<int> node,
    bool Function(TreeNode<int>) predicate,
  ) {
    var found = <TreeNode, int>{};

    int run(
      TreeNode<int> node,
      bool Function(TreeNode<int>) predicate,
    ) {
      return found[node] ??
          found.putIfAbsent(node, () {
            if (predicate(node)) {
              return 1;
            }
            return node.children.fold(0, (prev, element) {
              return prev + run(element, predicate);
            });
          });
    }

    run(node, predicate);

    return found[node];
  }
}
