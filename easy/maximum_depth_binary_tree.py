from collections import deque


class Node(object):
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BinaryTree(object):
    def __init__(self, root):
        self.root = Node(root)

    def maximum_depth_with_recursive_dfs(self, root: Node) -> int:
        if root is None:
            return 0
        return 1 + max(self.maximum_depth_with_recursive_dfs(root.left),
                       self.maximum_depth_with_recursive_dfs(root.right))

    def maximum_depth_with_bfs(self, root: Node) -> int:
        if root is None:
            return 0
        queue = deque([root])
        count = 0
        while queue:
            for i in range(len(queue)):
                node = queue.pop()
                if node.left:
                    queue.appendleft(node.left)
                if node.right:
                    queue.appendleft(node.right)
            count += 1
        return count

    def maximum_depth_with_iterative_dfs(self, root: Node) -> int:
        if root is None:
            return 0

        stack = [[root, 1]]
        res = 1

        while stack:
            node, depth = stack.pop()
            if node.left:
                stack.append([node.left, depth+1])
            if node.right:
                stack.append([node.right, depth+1])
            res = max(res, depth)
        return res


def main():
    tree = BinaryTree(10)
    tree.root.left = Node(2)
    tree.root.right = Node(3)
    tree.root.left.left = Node(4)
    tree.root.left.right = Node(10)
    tree.root.right.left = Node(10)
    tree.root.right.right = Node(20)
    tree.root.left.left.left = Node(100)

    print(
        f"Maximum Depth of a tree with recursive dfs: {tree.maximum_depth_with_recursive_dfs(tree.root)}")
    print(
        f"Maximum Depth of a tree with bfs: {tree.maximum_depth_with_bfs(tree.root)}")
    print(
        f"Maximum Depth of a tree with iterative dfs: {tree.maximum_depth_with_iterative_dfs(tree.root)}")


if __name__ == "__main__":
    main()
