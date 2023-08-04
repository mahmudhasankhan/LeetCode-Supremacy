from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class LinkedList:
    def __init__(self, head: Optional[ListNode]):
        self.head = ListNode(head)

    def append(self, value: int):
        new_node = ListNode(value)
        if self.head is None:
            self.head = new_node
        curr = self.head
        while curr.next:
            curr = curr.next
        curr.next = new_node

    def print_list(self) -> str:
        if self.head is None:
            return "Empty Linked List"
        else:
            return self.print_linked_list(self.head, "")

    def print_linked_list(self, head: ListNode, traversal: str) -> str:

        if head:
            traversal += str(head.val) + "->"
            traversal = self.print_linked_list(head.next, traversal)
        return traversal
