from linked_list import ListNode, LinkedList
from typing import Optional


class Solution:
    def merge_two_lists(self, l1: Optional[ListNode],
                        l2: Optional[ListNode]) -> ListNode:
        head = ListNode(None)
        tail = head
        while l1 and l2:
            if l1.val <= l2.val:
                tail.next = l1
                l1 = l1.next
            else:
                tail.next = l2
                l2 = l2.next
            tail = tail.next
        if not l1:
            tail.next = l2
        if not l2:
            tail.next = l1

        return head.next


def main():
    # list1 = LinkedList(1)
    # list1.head.next = ListNode(2)
    # list1.head.next.next = ListNode(4)
    list1 = LinkedList(1)
    list1.append(2)
    list1.append(4)
    print(list1.print_list())

    list2 = LinkedList(1)
    list2.append(3)
    list2.append(4)
    print(list2.print_list())

    merged_head = Solution().merge_two_lists(list1.head,
                                             list2.head)
    merged_list = LinkedList(None)
    merged_list.head = merged_head
    print(f"Merged Linked List: {merged_list.print_list()}")


if __name__ == "__main__":
    main()
