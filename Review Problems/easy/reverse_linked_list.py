# Definition for singly-linked list.
from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class LinkedList:
    def __init__(self, head: ListNode):
        self.head = head

    def print_linked_list(self, head: ListNode, traversal: str) -> str:

        if head is None:
            return "Empty"
        traversal += str(head.val) + "->"
        traversal = self.print_linked_list(head.next, "")


class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # iterative solution
        prev, curr = None, head
        while curr:
            temp = curr.next
            curr.next = prev
            prev = curr
            curr = temp
        return prev


def main():
    l_list = LinkedList(ListNode(1))
    l_list.head.next = ListNode(2)
    l_list.head.next.next = ListNode(3)
    l_list.head.next.next.next = ListNode(4)
    l_list.head.next.next.next.next = ListNode(5)


if __name__ == "__main__":
    main()
