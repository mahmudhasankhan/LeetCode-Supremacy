class Node(object):
    def __init__(self, val=0):
        self.val = val
        self.left = None
        self.right = None


class BinaryTree(object):
    def __init__(self, root):
        self.root = Node(root)


class Solution:
    def is_same_tree(self, p: Node, q: Node) -> bool:

        def pre_order_traversal(node: Node, traversal_string: str) -> str:
            """Root->Left->Right"""
            if node:
                traversal_string += str(node.val) + "->"
                traversal_string = pre_order_traversal(
                    node.left, traversal_string)
                traversal_string = pre_order_traversal(
                    node.right, traversal_string)
            else:
                traversal_string += "null" + "->"
            return traversal_string
        tree1_traversed = pre_order_traversal(p, "")
        tree2_traversed = pre_order_traversal(q, "")
        print(f"First Tree: {tree1_traversed}")
        print(f"Second Tree: {tree2_traversed}")

        return True if tree1_traversed == tree2_traversed else False


#           Tree
#
#            1
#           / \
#          2   3

#         New Tree
#
#            1
#           / \
#          2   3


def main():
    tree = BinaryTree(1)
    tree.root.left = Node(2)
    tree.root.right = Node(3)

    new_tree = BinaryTree(1)
    new_tree.root.left = Node(2)
    new_tree.root.right = Node(3)

    print(
        f"Same Tree or not? -> {Solution().is_same_tree(tree.root, new_tree.root)}")


if __name__ == "__main__":
    main()
