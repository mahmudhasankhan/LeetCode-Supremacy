class Node(object):
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BinaryTree(object):
    def __init__(self, root):
        self.root = Node(root)

    def invert_tree(self, root: Node) -> Node:
        if root is None:
            return None
        else:
            temp = root.left
            root.left = root.right
            root.right = temp
            self.invert_tree(root.left)
            self.invert_tree(root.right)
        return root
