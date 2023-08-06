# Definition for a binary tree node.
from typing import Optional


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def hasPathSum(self, root: Optional[TreeNode], targetSum: int) -> bool:
        if not root:
            return False

        def dfs(node: Optional[TreeNode], curr_sum: int) -> bool:
            curr_sum += node.val
            if not node.left and not node.right:
                return curr_sum == targetSum
            return (dfs(root.left, curr_sum) or dfs(root.right, curr_sum))
        return dfs(root, 0)


def main():
    pass


if __name__ == "__main__":
    main()
