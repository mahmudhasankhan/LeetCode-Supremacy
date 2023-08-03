class Node(object):
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BinaryTree(object):
    def __init__(self, root):
        self.root = Node(root)

    def is_symmetric(self, root: Node) -> bool:
        flag = None
        if root is None:
            return False
        else:
            self.is_symmetric(root.left)
            self.is_symmetric(root.right)

        return flag


#           Tree
#
#            1
#           / \
#          2   2
#         / \ / \
#        3  4 4  3


def main():
    tree = BinaryTree(1)
    tree.root.left = Node(2)
    tree.root.right = Node(2)
    tree.root.left.left = Node(3)
    tree.root.left.right = Node(4)
    tree.root.right.left = Node(4)
    tree.root.right.right = Node(3)

    print(tree.is_symmetric(tree.root))


if __name__ == "__main__":
    main()
