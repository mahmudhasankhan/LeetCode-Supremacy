# Definition for singly-linked list.
from typing import Optional
from linked_list import LinkedList, ListNode


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
    l_list = LinkedList(1)
    l_list.head.next = ListNode(2)
    l_list.head.next.next = ListNode(3)
    l_list.head.next.next.next = ListNode(4)
    l_list.head.next.next.next.next = ListNode(5)
    print(l_list.print_list())
    # while l_list.head:
    #     print(l_list.head.val)
    #     l_list.head = l_list.head.next


if __name__ == "__main__":
    main()
